import { IsNotEmpty, IsString } from "class-validator";

export class CreateUserDto {
    @IsNotEmpty()
    @IsString()
    username: string;

    @IsNotEmpty()
    @IsString()
    password: string;

    @IsNotEmpty()
    @IsString()
    fullname: string;
     
    dob: Date;

    @IsString()
    email: string;

    @IsString()
    phone: string;

    score: number;

    @IsString()
    avatar: string;
}
