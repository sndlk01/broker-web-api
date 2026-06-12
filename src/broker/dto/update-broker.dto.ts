import { IsString, IsUrl, IsEnum, IsOptional } from 'class-validator';
import { brokerType } from '../../../generated/prisma/client';

export class UpdateBrokerDto {
  @IsOptional()
  @IsString()
  name?: string;

  @IsOptional()
  @IsString()
  description?: string;

  @IsOptional()
  @IsUrl()
  logo_url?: string;

  @IsOptional()
  @IsUrl()
  website?: string;

  @IsOptional()
  @IsEnum(brokerType)
  broker_type?: brokerType;
}
