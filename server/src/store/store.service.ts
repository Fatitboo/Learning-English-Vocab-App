import {Injectable} from '@nestjs/common';
import {InjectRepository} from '@nestjs/typeorm';
import {Repository} from 'typeorm';
import {Store} from './entity/store.entity';
import {CreateStoreDTO} from './DTO/create-store-dto';
import {User} from 'src/user/entities/user.entity';
import {Word} from 'src/word/entity/word.entity';

@Injectable()
export class StoreService {
  constructor(
    @InjectRepository(Store)
    private readonly storeRepository: Repository<Store>,
    @InjectRepository(User)
    private userRepository: Repository<User>,
    @InjectRepository(Word)
    private wordRepository: Repository<Word>,
  ) {}

  async saveWord(createStoreDTO: CreateStoreDTO) {
    const user = await this.userRepository.findOne({
      where: {id: Number(createStoreDTO.user)},
    });
    const word = await this.wordRepository.findOne({
      where: {id: Number(createStoreDTO.word)},
    });
    const item = this.storeRepository.create({user, word});
    return this.storeRepository.save(item);
  }

  async deleteSavedWord(createStoreDTO: CreateStoreDTO) {
    const user = await this.userRepository.findOne({
      where: {id: Number(createStoreDTO.user)},
    });
    const word = await this.wordRepository.findOne({
      where: {id: Number(createStoreDTO.word)},
    });
    this.storeRepository.delete({user: user, word: word});
  }
}
