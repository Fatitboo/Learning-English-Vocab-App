import {
  Controller,
  Get,
  HttpStatus,
  Param,
  ParseIntPipe,
  Put,
  Res,
} from '@nestjs/common';
import {WordService} from './word.service';
import {Response} from 'express';

@Controller('word')
export class WordController {
  constructor(private readonly wordService: WordService) {}

  @Get('getAllWordFromTopic/:userId/:id')
  async getAllWordFromTopic(
    @Param('userId', ParseIntPipe) userId: number,
    @Param('id', ParseIntPipe) topicId: number,
    @Res() res: Response,
  ) {
    try {
      const words = await this.wordService.getAllWordFromTopic(userId, topicId);

      res.status(HttpStatus.OK).json(words);
    } catch (error) {
      res.status(HttpStatus.BAD_REQUEST).json({
        message: 'Error',
      });
    }
  }

  @Get('getAllSavedWords/:userId')
  async getAllSavedWords(
    @Param('userId', ParseIntPipe) userId: number,
    @Res() res: Response,
  ) {
    try {
      const words = await this.wordService.getAllSavedWords(userId);

      res.status(HttpStatus.OK).json(words);
    } catch (error) {
      res.status(HttpStatus.BAD_REQUEST).json({
        message: 'Error',
      });
    }
  }
}
