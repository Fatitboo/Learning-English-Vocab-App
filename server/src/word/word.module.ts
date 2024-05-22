import {Module} from '@nestjs/common';
import {WordService} from './word.service';
import {WordController} from './word.controller';
import {TypeOrmModule} from '@nestjs/typeorm';
import {Word} from './entity/word.entity';
import {User} from 'src/user/entities/user.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Word]), TypeOrmModule.forFeature([User])],
  providers: [WordService],
  controllers: [WordController],
})
export class WordModule {}
