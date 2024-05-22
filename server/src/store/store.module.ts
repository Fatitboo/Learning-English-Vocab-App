import {Module} from '@nestjs/common';
import {TypeOrmModule} from '@nestjs/typeorm';
import {Store} from './entity/store.entity';
import {StoreService} from './store.service';
import {StoreController} from './store.controller';
import {Word} from 'src/word/entity/word.entity';
import {User} from 'src/user/entities/user.entity';

@Module({
  imports: [
    TypeOrmModule.forFeature([Store]),
    TypeOrmModule.forFeature([Word]),
    TypeOrmModule.forFeature([User]),
  ],
  providers: [StoreService],
  controllers: [StoreController],
})
export class StoreModule {}
