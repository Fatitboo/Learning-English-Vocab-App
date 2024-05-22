import { Learnt } from 'src/learnt/entity/learnt.entity';
import { Store } from 'src/store/entity/store.entity';
import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from 'typeorm';
@Entity()
export class User {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ unique: true })
  username: string;

  @Column()
  password: string;

  @Column({ nullable: true })
  fullname: string;

  @Column({ nullable: true })
  dob: Date;

  @Column()
  email: string;

  @Column({ nullable: true })
  phone: string;

  @Column({ default: 0 })
  score: number;

  @Column({ nullable: true })
  avatar: string;

  @Column({ nullable: true })
  googleAccountId: string;

  @Column({ nullable: true })
  passwordResetToken: string;

  @Column({ nullable: true })
  passwordResetExpires: Date;

  @OneToMany(() => Learnt, (learnt) => learnt.user)
  learnts: Learnt[];

  @OneToMany(() => Store, (store) => store.user)
  stores: Store[];
}
