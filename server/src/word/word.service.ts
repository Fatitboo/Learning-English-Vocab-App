import { Injectable } from '@nestjs/common';
import { Word } from './entity/word.entity';
import { Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';

@Injectable()
export class WordService {
  constructor(
    @InjectRepository(Word) private readonly wordRepository: Repository<Word>,
  ) {}

  async getAllWordFromTopic(topicId: number) {
    const words = await this.wordRepository.find({
      where: { topic: { id: topicId } },
      relations: ['topic'],
    });
    return words;
  }
}
