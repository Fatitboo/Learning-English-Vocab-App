import { Topic } from 'src/topic/entity/topic.entity';
import { Column, Entity, ManyToOne, PrimaryGeneratedColumn } from 'typeorm';
@Entity()
export class Word {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ nullable: false })
  wordName: string;

  @Column()
  wordMean: string;

  @Column()
  spelling: string;

  @Column()
  image: string;

  @Column()
  wordType: string;

  @Column()
  audio: string;

  @ManyToOne(() => Topic, (topic) => topic.words)
  topic: Topic;
}
