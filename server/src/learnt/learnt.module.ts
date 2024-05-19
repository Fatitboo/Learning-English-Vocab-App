import { Module } from '@nestjs/common';
import { LearntService } from './learnt.service';
import { LearntController } from './learnt.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Learnt } from './entity/learnt.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Learnt])],
  providers: [LearntService],
  controllers: [LearntController],
})
export class LearntModule {}
