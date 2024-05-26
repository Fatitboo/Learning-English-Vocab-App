import {Module} from '@nestjs/common';
import {TopicService} from './topic.service';
import {TopicController} from './topic.controller';
import {Topic} from './entity/topic.entity';
import {TypeOrmModule} from '@nestjs/typeorm';
import {UserModule} from 'src/user/user.module';
import {UserService} from 'src/user/user.service';
import {User} from 'src/user/entities/user.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Topic, User])],
  providers: [TopicService],
  controllers: [TopicController],
  exports: [TypeOrmModule],
})
export class TopicModule {}
