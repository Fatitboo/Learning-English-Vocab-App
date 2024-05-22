import {
  Controller,
  Get,
  HttpStatus,
  Param,
  ParseIntPipe,
  Req,
  Res,
} from '@nestjs/common';
import { LearntService } from './learnt.service';
import { Request, Response } from 'express';

@Controller('learnt')
export class LearntController {
  constructor(private readonly learnService: LearntService) {}

  @Get('getWordsGroupedByTopic')
  async getWordsGroupedByTopic(@Res() res: Response, @Req() req: Request) {
    try {
      const username = req['user'].username;
      const wordsGroupedByTopic =
        await this.learnService.getWordsGroupedByTopic(username);
      res.status(HttpStatus.OK).json(wordsGroupedByTopic);
    } catch (error) {
      res.status(HttpStatus.OK).json(error.message);
    }
  }
}
