import { Module } from '@nestjs/common';
import { UserService } from './user.service';
import { UserController } from './user.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { User } from './entities/user.entity';
import { JwtModule } from '@nestjs/jwt';
import { GoogleStrategy } from './google.strategy';
import { LearntModule } from 'src/learnt/learnt.module';
import { TopicModule } from 'src/topic/topic.module';

@Module({
  imports:[
    JwtModule.register({
      global: true,
      secret: "401b45ad307745673e0ddcce5476b684c10100dc7a0366898735c654e944c8630b5ebc603eb5b007c934a78c25e44c9d28beecbc6795efebe21bd37144ab98d4",
      signOptions:{expiresIn:'1d'}
    }),
    TypeOrmModule.forFeature([User]),
    LearntModule,
    TopicModule
],
  controllers: [UserController],
  providers: [UserService],
})
export class UserModule {}
