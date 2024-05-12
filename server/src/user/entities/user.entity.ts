import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';
@Entity()
export class User {
    @PrimaryGeneratedColumn() 
    id: number;
    @Column()
    username: string;
    @Column()
    password: string;
    @Column() 
    fullname: string;
    @Column() 
    dob: Date;
    @Column()
    email: string;
    @Column() 
    phone: string;
    @Column({default:0})
    score: number;
    @Column() 
    avatar: string;

}