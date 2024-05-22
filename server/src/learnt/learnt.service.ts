import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Learnt } from './entity/learnt.entity';
import { Repository } from 'typeorm';

@Injectable()
export class LearntService {
  constructor(
    @InjectRepository(Learnt)
    private readonly learntRepository: Repository<Learnt>,
  ) {}

  async getWordsGroupedByTopic(username: string) {
    return this.learntRepository
      .createQueryBuilder('learnt')
      .innerJoinAndSelect('learnt.word', 'word')
      .innerJoinAndSelect('word.topic', 'topic')
      .innerJoin('learnt.user', 'user')
      .where('user.username = :username', { username })
      .select(['topic.id', 'topic.topicName', 'word.id', 'word.wordName'])
      .groupBy('topic.id, word.id')
      .orderBy('topic.id')
      .getRawMany();
  }
}
