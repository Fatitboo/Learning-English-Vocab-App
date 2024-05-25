import {Injectable} from '@nestjs/common';
import {Topic} from './entity/topic.entity';
import {InjectRepository} from '@nestjs/typeorm';
import {Repository} from 'typeorm';
import {Learnt} from 'src/learnt/entity/learnt.entity';
import {User} from 'src/user/entities/user.entity';

@Injectable()
export class TopicService {
  constructor(
    @InjectRepository(Topic)
    private readonly topicRepository: Repository<Topic>,

    @InjectRepository(User)
    private readonly userRepository: Repository<User>,
  ) {}

  async getAllTopic() {
    const topics = await this.topicRepository.find();
    return topics;
  }

  async getAlgetAllTopicLearnedTopic() {
    const topics = await this.topicRepository.find();
    return topics;
  }

  async getWordsLearnedGroupedByTopic(username: string) {
    // Tìm người dùng theo username
    const user = await this.userRepository.findOne({
      where: {
        username: username,
      },
    });

    // Lấy userId từ người dùng đã tìm
    const userId = user.id;

    // Truy vấn để lấy dữ liệu nhóm theo chủ đề
    const topics = await this.topicRepository
      .createQueryBuilder('topic')
      .leftJoin('topic.words', 'word')
      .leftJoin(
        Learnt,
        'learnt',
        'learnt.wordId = word.id AND learnt.userId = :userId',
        {userId},
      )
      .groupBy('topic.id')
      .addGroupBy('topic.topicName')
      .addGroupBy('topic.topicImage') // Thêm group by cho topicImage
      .select([
        'topic.id AS topicId',
        'topic.topicName AS topicName',
        'topic.topicImage AS topicImage', // Thêm topicImage vào select
        'CAST(COUNT(word.id) AS INTEGER) AS totalWords', // Chuyển đổi COUNT(word.id) sang INTEGER
        'CAST(COUNT(learnt.id) AS INTEGER) AS learntWords',
      ])
      .orderBy('topic.id', 'ASC')
      .getRawMany();
    const formattedTopics = topics.map(topic => ({
      topicId: topic.topicid,
      topicName: topic.topicname,
      topicImage: topic.topicimage,
      totalWords: topic.totalwords,
      learntWords: topic.learntwords,
    }));

    // Trả về kết quả
    return formattedTopics;
  }

  async getAllTopicHasLearntWord(username: string) {
    const list = await this.topicRepository
      .createQueryBuilder('topic')
      .leftJoinAndSelect('topic.words', 'word')
      .leftJoin('word.learnts', 'learnt')
      .leftJoin('learnt.user', 'user')
      .where('user.username = :username', {username})
      .getMany();

    return list;
  }
}
