import {Module} from '@nestjs/common';
import {LearntService} from './learnt.service';
import {LearntController} from './learnt.controller';
import {TypeOrmModule} from '@nestjs/typeorm';
import {Learnt} from './entity/learnt.entity';
import {User} from 'src/user/entities/user.entity';
import {Word} from 'src/word/entity/word.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Learnt, User, Word])],
  providers: [LearntService],
  controllers: [LearntController],
})
export class LearntModule {}
