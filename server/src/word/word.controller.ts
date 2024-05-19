import {
  Controller,
  Get,
  HttpStatus,
  Param,
  ParseIntPipe,
  Res,
} from '@nestjs/common';
import { WordService } from './word.service';
import { Response } from 'express';

@Controller('word')
export class WordController {
  constructor(private readonly wordService: WordService) {}

  @Get('getAllWordFromTopic/:id')
  async getAllWordFromTopic(
    @Param('id', ParseIntPipe) topicId: number,
    @Res() res: Response,
  ) {
    try {
      const words = await this.wordService.getAllWordFromTopic(topicId);
      res.status(HttpStatus.OK).json(words);
    } catch (error) {
      res.status(HttpStatus.BAD_REQUEST).json({
        message: 'Error',
      });
    }
  }
}
