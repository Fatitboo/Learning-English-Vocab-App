import {
  Body,
  Controller,
  Get,
  HttpStatus,
  Param,
  ParseIntPipe,
  Post,
  Req,
  Res,
} from '@nestjs/common';
import {LearntService} from './learnt.service';
import {Request, Response} from 'express';

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
  @Post('saveLearntWords')
  async saveLearntWords(@Req() req: Request, @Res() res: Response) {
    try {
      const wordIds = req.body;
      const username = req['user'].username;
      console.log(wordIds);
      const result = await this.learnService.saveLearntWords(wordIds, username);
      res.status(HttpStatus.OK).json(result);
    } catch (error) {
      console.log(error);
      res.status(HttpStatus.OK).json(error.message);
    }
  }

  @Get('getWordsByTopic/:topicId')
  async getWordsByTopic(@Req() req: Request, @Res() res: Response) {
    try {
      const username = req['user'].username;
      const {topicId} = req.params;
      const result = await this.learnService.getWordsByTopic(
        Number(topicId),
        username,
      );
      res.status(HttpStatus.OK).json(result);
    } catch (error) {
      console.log(error);
      res.status(HttpStatus.OK).json(error.message);
    }
  }
}
