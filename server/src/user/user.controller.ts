import { Controller, Get, Post, Body, Patch, Param, Delete, UsePipes, ValidationPipe, Query, Res, Req, UseGuards, BadRequestException } from '@nestjs/common';
import { UserService } from './user.service';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { Public } from './authPublic.decorator';
import { Request, Response } from 'express';
import { AuthGuard } from '@nestjs/passport';

@Controller('user')
export class UserController {
  constructor(private readonly userService: UserService) { }
  @Public()
  @Post('login')
  async login(@Body() req, @Res() res: Response) {
    const user = await this.userService.validateUser(req.username, req.password);
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
  async checkOtpReset(@Param("username") username: string, @Query() queryParams: any, @Res() res: Response) {
    const u = await this.userService.checkOtp(queryParams.otp, username)
    res.status(200).json(u);
  }

  @Public()
  @Post('reset-password')
  async resetPassword(@Body() req: any, @Res() res: Response) {
    const u = await this.userService.resetPassword(req?.username, req?.password)
    res.status(200).json(u);
  }
}
