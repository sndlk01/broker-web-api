import {
  Controller,
  Get,
  Post,
  Body,
  Param,
  Query,
  UseGuards,
} from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { BrokerService } from './broker.service';
import { CreateBrokerDto } from './dto/create-broker.dto';
import { brokerType } from '../../generated/prisma/client';

@Controller('brokers')
export class BrokerController {
  constructor(private brokerService: BrokerService) {}

  // /brokers
  @Post()
  @UseGuards(AuthGuard('jwt'))
  create(@Body() dto: CreateBrokerDto) {
    return this.brokerService.create(dto);
  }

  // /brokers?search=
  @Get()
  findAll(@Query('search') search?: string, @Query('type') type?: brokerType) {
    return this.brokerService.findAll(search, type);
  }

  // /brokers/:slug
  @Get(':slug')
  findOne(@Param('slug') slug: string) {
    return this.brokerService.findOne(slug);
  }
}
