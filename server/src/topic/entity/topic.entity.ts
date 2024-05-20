import { Word } from 'src/word/entity/word.entity';
import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from 'typeorm';
@Entity()
export class Topic {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ unique: true })
  topicName: string;

  @Column()
  topicDescription: string;

  @Column({ nullable: false })
  topicImage: string;

  @OneToMany(() => Word, (word) => word.topic)
  words: Word[];
}
