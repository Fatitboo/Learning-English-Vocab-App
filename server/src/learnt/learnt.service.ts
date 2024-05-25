import {Injectable} from '@nestjs/common';
import {InjectRepository} from '@nestjs/typeorm';
import {Learnt} from './entity/learnt.entity';
import {Repository} from 'typeorm';
import {User} from 'src/user/entities/user.entity';
import {Word} from 'src/word/entity/word.entity';

@Injectable()
export class LearntService {
  constructor(
    @InjectRepository(Learnt)
    private readonly learntRepository: Repository<Learnt>,

    @InjectRepository(User)
    private readonly userRepository: Repository<User>,

    @InjectRepository(Word)
    private readonly wordRepository: Repository<Word>,
  ) {}

  async getWordsGroupedByTopic(username: string) {
    return this.learntRepository
      .createQueryBuilder('learnt')
      .innerJoinAndSelect('learnt.word', 'word')
      .innerJoinAndSelect('word.topic', 'topic')
      .innerJoin('learnt.user', 'user')
      .where('user.username = :username', {username})
      .select(['topic.id', 'topic.topicName', 'word.id', 'word.wordName'])
      .groupBy('topic.id, word.id')
      .orderBy('topic.id')
      .getRawMany();
  }
  async saveLearntWords(wordIds: Array<number>, username: string) {
    const user = await this.userRepository.findOne({
      where: {
        username: username,
      },
    });

    // Lấy userId từ người dùng đã tìm
    for (const wordId of wordIds) {
      // Lấy đối tượng Word từ cơ sở dữ liệu
      const word = await this.wordRepository.findOne({
        where: {
          id: wordId,
        },
      });

      // Tạo đối tượng Learnt mới
      const learnt = new Learnt();
      learnt.user = user;
      learnt.word = word;

      // Lưu đối tượng Learnt vào cơ sở dữ liệu
      await this.learntRepository.save(learnt);
    }

    return 'success';
  }
  async getWordsByTopic(topicId: number, username: string) {
    const list = await this.learntRepository.find({
      relations: {
        word: true,
      },
      where: {
        user: {
          username: username,
        },
        word: {
          topic: {
            id: topicId,
          },
        },
      },
      select: {
        id: false,
      },
    });
    return list.map(item => item.word);
  }
}
