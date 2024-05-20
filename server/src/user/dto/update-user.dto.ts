import { IsNotEmpty, IsString } from 'class-validator';

export class UpdateUserDto  {
  @IsNotEmpty()
  @IsString()
  fullname: string;

  @IsNotEmpty()
  @IsString()
  email: string;

  @IsNotEmpty()
  @IsString()
  phone: string;
   
  @IsNotEmpty()
  @IsString()
  dob: string;
}
