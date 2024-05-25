import {Controller, Get, HttpStatus, Req, Res} from '@nestjs/common';
import {TopicService} from './topic.service';
import {Response} from 'express';
import {UserService} from 'src/user/user.service';

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
  @Get('getAllTopicLearned')
  async getAllTopicLearned(@Res() res: Response) {
    try {
      //   const topics = await this.topicService.getAllTopicLearned();
      const topics = [];
      res.status(HttpStatus.OK).json(topics);
    } catch (error) {
      res.status(HttpStatus.BAD_REQUEST).json({
        message: 'Error',
      });
    }
  }

  @Get('getWordsLearnedGroupedByTopic')
  async getWordsLearnedGroupedByTopic(
    @Req() req: Request,
    @Res() res: Response,
  ) {
    try {
      const userName = req['user'].username;

      const topics =
        await this.topicService.getWordsLearnedGroupedByTopic(userName);

      res.status(HttpStatus.OK).json(topics);
      // const topics = [];
      // res.status(HttpStatus.OK).json(topics);
    } catch (error) {
      res.status(HttpStatus.BAD_REQUEST).json({
        message: 'Error',
      });
    }
  }

  @Get('getAllTopicHasLearntWord')
  async getAllTopicHasLearntWord(@Req() req: Request, @Res() res: Response) {
    try {
      const username = req['user'].username;
      const result = await this.topicService.getAllTopicHasLearntWord(username);
      console.log(result);
      res.status(HttpStatus.OK).json(result);
    } catch (error) {
      console.log(error);
      res.status(HttpStatus.OK).json(error.message);
    }
  }
}
