import {Injectable} from '@nestjs/common';
import {Word} from './entity/word.entity';
import {Repository} from 'typeorm';
import {InjectRepository} from '@nestjs/typeorm';
import {Store} from 'src/store/entity/store.entity';
import {User} from 'src/user/entities/user.entity';
import {Learnt} from 'src/learnt/entity/learnt.entity';

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

  async getAllWordNotLearnByTopic(username: string, topicId: number) {
    const user = await this.userRepository.findOne({
      where: {
        username: username,
      },
    });
    const userId = user.id;
    const resluts = await this.wordRepository
      .createQueryBuilder('word')
      .leftJoin('word.topic', 'topic')
      .leftJoin(
        Learnt,
        'learnt',
        'learnt.wordId = word.id AND learnt.userId = :userId',
        {userId: userId}, // Thay yourUserId bằng userId cụ thể
      )
      .where('topic.id = :topicId', {topicId: topicId}) // Thay yourTopicId bằng topicId cụ thể
      .andWhere('learnt.id IS NULL')
      .limit(10)
      .select([
        'word.id as id',
        'word.wordName as wordName',
        'word.wordMean as wordMean',
        'word.spelling as spelling',
        'word.image as image',
        'word.wordType as wordType',
        'word.audio as audio',
        'topic.id as topicId',
      ])
      .getRawMany();
    console.log(resluts.length);
    const formattedWords = resluts.map(word => ({
      id: word.id,
      wordName: word.wordname,
      wordMean: word.wordmean,
      spelling: word.spelling,
      image: word.image,
      wordType: word.wordtype,
      audio: word.audio,
      topicId: word.topicid,
    }));
    return formattedWords;
  }
}
