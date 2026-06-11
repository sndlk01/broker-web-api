import { Module } from '@nestjs/common';
import { BrokerController } from './broker.controller';
import { BrokerService } from './broker.service';
import { PrismaService } from '../../prisma/prisma.service';

@Module({
  controllers: [BrokerController],
  providers: [BrokerService, PrismaService],
})
export class BrokerModule {}
