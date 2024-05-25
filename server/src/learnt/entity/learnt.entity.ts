import {User} from 'src/user/entities/user.entity';
import {Word} from 'src/word/entity/word.entity';
import {Entity, ManyToOne, PrimaryGeneratedColumn} from 'typeorm';
@Entity()
export class Learnt {
  @PrimaryGeneratedColumn()
  id: number;

  @ManyToOne(() => User)
  user: User;

  @ManyToOne(() => Word, word => word.learnts)
  word: Word;
}
