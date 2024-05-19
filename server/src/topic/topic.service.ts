import { Injectable } from '@nestjs/common';
import { Topic } from './entity/topic.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';

@Injectable()
export class TopicService {
  constructor(
    @InjectRepository(Topic)
    private readonly topicRepository: Repository<Topic>,
  ) {}

  async getAllTopic() {
    const topics = await this.topicRepository.find();
    return topics;
  }
}
