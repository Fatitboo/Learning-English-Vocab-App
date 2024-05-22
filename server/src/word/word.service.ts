import {Injectable} from '@nestjs/common';
import {Word} from './entity/word.entity';
import {Repository} from 'typeorm';
import {InjectRepository} from '@nestjs/typeorm';
import {Store} from 'src/store/entity/store.entity';
import {User} from 'src/user/entities/user.entity';

@Injectable()
export class WordService {
  constructor(
    @InjectRepository(User)
    private userRepository: Repository<User>,
    @InjectRepository(Word)
    private wordRepository: Repository<Word>,
  ) {}

  async getAllWordFromTopic(userId: number, topicId: number) {
    const words = await this.wordRepository.find({
      where: {topic: {id: topicId}},
      relations: ['topic'],
    });

    const user = await this.userRepository.findOne({
      where: {
        id: userId,
      },
      relations: ['stores', 'stores.word'],
    });

    const wordIdSaved = user.stores;
    console.log(wordIdSaved);

    const mainWords = words.map(word => {
      return {
        ...word,
        saved: wordIdSaved.find(s => s.word.id === word.id) ? true : false,
      };
    });

    return mainWords;
  }

  async getAllSavedWords(userId: number) {
    const user = await this.userRepository.findOne({
      where: {
        id: userId,
      },
      relations: ['stores', 'stores.word'],
    });
    const words = user.stores.map(e => e.word);
    return words;
  }
}
