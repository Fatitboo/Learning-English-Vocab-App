import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import {JwtService} from '@nestjs/jwt';
import {InjectRepository} from '@nestjs/typeorm';
import {Repository} from 'typeorm';
import * as bcrypt from 'bcryptjs';
import {OAuth2Client} from 'passport-google-oauth20';
import {User} from './entities/user.entity';
import {CreateUserDto} from './dto/create-user.dto';
import {sendEmail} from 'src/utils/email.service';
import {templateHTMLResetPassword} from 'src/constants/template_email';
import {UpdateUserDto} from './dto/update-user.dto';
import {Learnt} from 'src/learnt/entity/learnt.entity';
import {Topic} from 'src/topic/entity/topic.entity';
import {UserStatisticsDto} from './dto/user-statistics.dto';

@Injectable()
export class UserService {
  constructor(
    private jwtService: JwtService,
    @InjectRepository(User) private readonly userRepository: Repository<User>,
    @InjectRepository(Learnt)
    private readonly learntRepository: Repository<Learnt>,
    @InjectRepository(Topic)
    private readonly topicRepository: Repository<Topic>,
  ) {}

  // private client = new OAuth2Client('426753784926-dmbba6127bn5avdf1uptppevohkkm4c6.apps.googleusercontent.com'); // Thay thế bằng Client ID của bạn
  // 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
  // async create(createUserDto: CreateUserDto): Promise<User> {
  //   return await this.userRepository.save(createUserDto);
  // }
  // async validateGoogleUser(idToken: string): Promise<any> {
  //   const ticket = await this.client.verifyIdToken({
  //     idToken,
  //     audience: '426753784926-dmbba6127bn5avdf1uptppevohkkm4c6.apps.googleusercontent.com', // Thay thế bằng Client ID của bạn
  //   });

  //   const payload = ticket.getPayload();
  //   const { email, name, picture } = payload;

  //   let user = await this.userRepository.findOneBy({username: email })
  //   if (user) {
  //     // Cập nhật thông tin người dùng hiện có
  //     user.fullname = name;
  //     user.avatar = picture;
  //   } else {
  //     // Tạo tài khoản mới nếu email chưa tồn tại
  //     user = this.userRepository.create({ username: email, email, fullname:name, avatar:picture });
  //   }
  //   let exitedUser = await this.userRepository.save(user);

  //   const pl = { sub: exitedUser.id, username: exitedUser.username };

  //   return {
  //     phoneNumber: exitedUser.username,
  //     avatar: exitedUser.avatar,
  //     userType: exitedUser.fullname,
  //     access_token: this.jwtService.sign(pl),
  //   };
  // }
  async validateGoogleUser(req) {
    // {
    //   username = googleAccountId
    //   password: 1
    //   googleAccountId,
    //   gmail
    // }
    const user = await this.userRepository.findOne({
      where: {
        username: req?.googleAccountId,
        googleAccountId: req?.googleAccountId,
        email: req?.email,
      },
    });
    if (!user) {
      const u = await this.userRepository.create({
        username: req?.googleAccountId,
        password: '1',
        fullname: req?.fullname,
        email: req?.email,
        googleAccountId: req?.googleAccountId,
        avatar: req?.avatar,
      });
      const savedUser = await this.userRepository.save(u);
      const {password, ...result} = savedUser;
      return result;
    }
    const {password, ...result} = user;
    return result;
  }

  async validateUser(username: string, pass: string): Promise<any> {
    const user = await this.userRepository.findOne({
      where: {username: username},
    });
    if (user && (await bcrypt.compare(pass, user.password))) {
      const {password, ...result} = user;
      return result;
    }
    return null;
  }

  async login(exitedUser: any) {
    const pl = {sub: exitedUser.id, username: exitedUser.username};

    return {
      userId: exitedUser.id,
      username: exitedUser.username,
      avatar: exitedUser.avatar,
      fullname: exitedUser.fullname,
      access_token: this.jwtService.sign(pl),
    };
  }

  async register(createUser: CreateUserDto) {
    const exitedUser = await this.userRepository.findOneBy({
      username: createUser?.username,
    });
    if (exitedUser) throw new BadRequestException('User existed.');
    const exitedEmail = await this.userRepository.findOneBy({
      email: createUser?.email,
      googleAccountId: null,
    });
    if (exitedEmail) throw new BadRequestException('Email existed.');
    const hashedPassword = await bcrypt.hash(createUser.password, 10);
    createUser.password = hashedPassword;
    createUser.avatar =
      'https://firebasestorage.googleapis.com/v0/b/englishvoc-43d5a.appspot.com/o/images%2FavatarDefault.png?alt=media&token=59aae8c1-2129-46ca-ad75-5dad1b119188';
    const user = this.userRepository.create(createUser);
    await this.userRepository.save(user);
    return {
      status: 'ok',
    };
  }
  async sendEmailReset(username: string): Promise<Record<string, string>> {
    const exitedUser = await this.userRepository.findOneBy({
      username: username,
    });
    if (!exitedUser) throw new BadRequestException('User not exist.');
    try {
      let randomString = '';
      for (let i = 0; i < 4; i++) {
        // Tạo một số ngẫu nhiên từ 0 đến 9
        const randomDigit = Math.floor(Math.random() * 10);
        // Thêm số ngẫu nhiên vào chuỗi
        randomString += randomDigit;
      }
      exitedUser.passwordResetToken = randomString;
      const now = new Date();
      now.setMinutes(now.getMinutes() + 10);
      exitedUser.passwordResetExpires = now;

      this.userRepository.save(exitedUser);

      return await sendEmail(
        exitedUser.email,
        templateHTMLResetPassword(randomString),
        'Đặt lại mật khẩu',
      );
    } catch (error) {
      throw new BadRequestException('Lỗi kết nối.');
    }
  }

  async checkOtp(
    otp: string,
    username: string,
  ): Promise<Record<string, string>> {
    const exitedUser = await this.userRepository.findOneBy({
      username: username,
    });
    if (!exitedUser) throw new NotFoundException('Người dùng không tồn tại.');
    if (exitedUser?.passwordResetToken !== otp)
      throw new BadRequestException('Mã xác thực không chính xác.');
    if (exitedUser?.passwordResetExpires < new Date())
      throw new BadRequestException('Mã đã hết hạn.');
    return {
      message: 'ok',
    };
  }
  async resetPassword(username: string, pass: string): Promise<any> {
    const exitedUser = await this.userRepository.findOneBy({
      username: username,
    });
    if (!exitedUser) throw new NotFoundException('Người dùng không tồn tại.');
    const hashedPassword = await bcrypt.hash(pass, 10);
    exitedUser.password = hashedPassword;
    const user = this.userRepository.create(exitedUser);
    await this.userRepository.save(user);
    return {status: 'ok'};
  }

  async currentUser(id: number): Promise<any> {
    const exitedUser = await this.userRepository.findOneBy({id: id});
    if (!exitedUser) {
      throw new NotFoundException('Người dùng không tồn tại.');
    }
    const {...result} = exitedUser;
    return result;
  }

  async updateInfoUser(
    id: number,
    updateUserDto: UpdateUserDto,
  ): Promise<User> {
    const user = await this.userRepository.findOneBy({id: id});
    if (!user) {
      throw new NotFoundException(`User with ID ${id} not found`);
    }

    // Update user fields
    user.fullname = updateUserDto.fullname;
    user.email = updateUserDto.email;
    user.phone = updateUserDto.phone;
    user.dob = updateUserDto.dob;
    user.avatar = updateUserDto.avatar;

    // Save updated user to the database
    await this.userRepository.save(user);
    return user;
  }

  async getAllUsersSortedByScore(): Promise<User[]> {
    return this.userRepository.find({
      order: {
        score: 'DESC',
      },
    });
  }

  async getUserStatistics(userId: number) {
    const results = await this.learntRepository
      .createQueryBuilder('learnt')
      .innerJoin('learnt.word', 'word')
      .innerJoin('word.topic', 'topic')
      .where('learnt.userId = :userId', {userId})
      .select('topic.id', 'topicId')
      .addSelect('topic.topicName', 'topicName')
      .addSelect('ARRAY_AGG(word.wordName)', 'words')
      .addSelect(subQuery => {
        return subQuery
          .select('CAST(COUNT(word.id) AS INTEGER)', 'totalWordOfTopic')
          .from('word', 'word')
          .where('word.topicId = topic.id');
      }, 'totalWordOfTopic')
      .groupBy('topic.id')
      .addGroupBy('topic.topicName')
      .getRawMany();

    var completedTopicsCount = 0;
    var learntWordsCount = 0;
    var inProcessTopicsCount = 0;
    for (var i = 0; i < results.length; i++) {
      learntWordsCount = learntWordsCount + results[i].words.length;
      if (results[i].words.length === results[i].totalWordOfTopic) {
        completedTopicsCount = completedTopicsCount + 1;
      } else {
        inProcessTopicsCount = inProcessTopicsCount + 1;
      }
    }

    const user = await this.userRepository.findOne({
      where: {id: userId},
    });

    const userStatisticsDto: UserStatisticsDto = {
      id: user.id,
      username: user.username,
      fullname: user.fullname,
      dob: user.dob,
      email: user.email,
      phone: user.phone,
      score: user.score,
      avatar: user.avatar,
      googleAccountId: user.googleAccountId,
      learntWordsCount: learntWordsCount,
      completedTopicsCount: completedTopicsCount,
      inProcessTopicsCount: inProcessTopicsCount,
    };

    return userStatisticsDto;
  }
  async addScore(username: string) {
    const user = await this.userRepository.findOne({
      where: {
        username: username,
      },
    });
    console.log(user);
    user.score += 5;
    this.userRepository.save(user);
    return 'success';
  }
}
