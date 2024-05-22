import {User} from 'src/user/entities/user.entity';
import {Word} from 'src/word/entity/word.entity';
import {Column, Entity, ManyToOne, PrimaryGeneratedColumn} from 'typeorm';
@Entity()
export class Store {
  @PrimaryGeneratedColumn()
  id: number;

  @ManyToOne(() => User, (user) => user.stores)
  //   @Column()
  user: User;

  @ManyToOne(() => Word)
  //   @Column()
  word: Word;
}
