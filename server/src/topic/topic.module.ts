import { Module } from '@nestjs/common';
import { TopicService } from './topic.service';
import { TopicController } from './topic.controller';
import { Topic } from './entity/topic.entity';
import { TypeOrmModule } from '@nestjs/typeorm';

@Module({
  imports: [TypeOrmModule.forFeature([Topic])],
  providers: [TopicService],
  controllers: [TopicController],
})
export class TopicModule {}
