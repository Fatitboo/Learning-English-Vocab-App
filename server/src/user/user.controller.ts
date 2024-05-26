import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  UsePipes,
  ValidationPipe,
  Query,
  Res,
  Req,
  UseGuards,
  BadRequestException,
  HttpCode,
  NotFoundException,
  Request,
  ParseIntPipe,
} from '@nestjs/common';
import {UserService} from './user.service';
import {CreateUserDto} from './dto/create-user.dto';
import {Public} from './authPublic.decorator';
import {Response} from 'express';
import {UpdateUserDto} from './dto/update-user.dto';

@Controller('user')
export class UserController {
  constructor(private readonly userService: UserService) {}

  @Public()
  @Post('login')
  async login(@Body() req, @Res() res: Response) {
    const user = await this.userService.validateUser(
      req.username,
      req.password,
    );
    if (!user) {
      throw new BadRequestException('Invalid username or password');
    }
    const u = await this.userService.login(user);
    res.status(200).json(u);
  }
  @Public()
  @Post('login-google')
  async loginGoogle(@Body() req, @Res() res: Response) {
    const user = await this.userService.validateGoogleUser(req);
    if (!user) {
      throw new BadRequestException('Invalid username or password');
    }
    const u = await this.userService.login(user);
    res.status(200).json(u);
  }

  @Public()
  @Post('register')
  async register(@Body() createUserDto: CreateUserDto, @Res() res: Response) {
    const u = await this.userService.register(createUserDto);
    res.status(200).json(u);
  }

  @Public()
  @Get('check-username')
  async checkEmail(@Query() queryParams: any, @Res() res: Response) {
    const u = await this.userService.sendEmailReset(queryParams.username);
    res.status(200).json(u);
  }

  @Public()
  @Get(':username/check-otp')
  async checkOtpReset(
    @Param('username') username: string,
    @Query() queryParams: any,
    @Res() res: Response,
  ) {
    const u = await this.userService.checkOtp(queryParams.otp, username);
    res.status(200).json(u);
  }

  @Public()
  @Post('reset-password')
  async resetPassword(@Body() req: any, @Res() res: Response) {
    const u = await this.userService.resetPassword(
      req?.username,
      req?.password,
    );
    res.status(200).json(u);
  }

  @Get('/current-user')
  async currentUser(@Request() req, @Res() res: Response) {
    try {
      const user = await this.userService.currentUser(req.user.sub);
      res.status(200).json(user);
    } catch (error) {
      if (error instanceof NotFoundException) {
        res.status(404).json({message: error.message});
      } else {
        res.status(500).json({message: 'Internal Server Error'});
      }
    }
  }

  @Patch(':id/update-info')
  async updateInfoUser(
    @Param('id') id: number,
    @Body() updateUserDto: UpdateUserDto,
    @Res() res: Response,
  ) {
    console.log('zo controller');
    try {
      const updatedUser = await this.userService.updateInfoUser(
        id,
        updateUserDto,
      );
      res.status(200).json(updatedUser);
    } catch (error) {
      if (error instanceof NotFoundException) {
        res.status(404).json({message: error.message});
      } else {
        res.status(500).json({message: 'Internal Server Error'});
      }
    }
  }

  @Patch('/addScore')
  async addScore(@Request() req, @Res() res: Response) {
    try {
      const result = await this.userService.addScore(req.user.username);
      res.status(200).json(result);
    } catch (error) {
      console.log(error);
      if (error instanceof NotFoundException) {
        res.status(404).json({message: error.message});
      } else {
        res.status(500).json({message: 'Internal Server Error'});
      }
    }
  }

  @Get('/get_all_users')
  async getAllUsersSortedByScore() {
    return this.userService.getAllUsersSortedByScore();
  }

  @Get(':id/statistics')
  async getUserStatistics(@Param('id', ParseIntPipe) id: number) {
    return this.userService.getUserStatistics(id);
  }
}
