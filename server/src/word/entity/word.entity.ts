import {Learnt} from 'src/learnt/entity/learnt.entity';
import {Store} from 'src/store/entity/store.entity';
import {Topic} from 'src/topic/entity/topic.entity';
import {
  Column,
  Entity,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from 'typeorm';
@Entity()
export class Word {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({nullable: false})
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

  @ManyToOne(() => Topic, topic => topic.words)
  topic: Topic;

  @OneToMany(() => Store, store => store.word)
  stores: Store[];

  @OneToMany(() => Learnt, learnt => learnt.word)
  learnts: Learnt[];
}
