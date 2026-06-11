import { IsString, IsUrl, IsEnum } from 'class-validator';
import { brokerType } from '../../../generated/prisma/client';

export class CreateBrokerDto {
  @IsString()
  name: string;

  @IsString()
  slug: string;

  @IsString()
  description: string;

  @IsUrl()
  logo_url: string;

  @IsUrl()
  website: string;

  @IsEnum(brokerType)
  broker_type: brokerType;
}
