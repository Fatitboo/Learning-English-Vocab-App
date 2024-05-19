import { Controller, Get, HttpStatus, Res } from '@nestjs/common';
import { TopicService } from './topic.service';
import { Response } from 'express';

@Controller('topic')
export class TopicController {
  constructor(private readonly topicService: TopicService) {}

  @Get('getAllTopic')
  async getAllTopic(@Res() res: Response) {
    try {
      const topics = await this.topicService.getAllTopic();
      res.status(HttpStatus.OK).json(topics);
    } catch (error) {
      res.status(HttpStatus.BAD_REQUEST).json({
        message: 'Error',
      });
    }
  }
}
