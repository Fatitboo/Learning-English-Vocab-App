import {IsNotEmpty, IsString} from 'class-validator';

export class CreateStoreDTO {
  @IsNotEmpty()
  @IsString()
  user: string;

  @IsNotEmpty()
  @IsString()
  word: string;
}
