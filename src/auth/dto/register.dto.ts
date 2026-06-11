import { IsString, MinLength } from 'class-validator';

export class RegisterDto {
  @IsString()
  full_name: string;

  @IsString()
  email: string;

  @IsString()
  @MinLength(6)
  password: string;
}
