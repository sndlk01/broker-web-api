import { Injectable, ConflictException } from '@nestjs/common';
import { PrismaService } from '../../prisma/prisma.service';
import { CreateBrokerDto } from './dto/create-broker.dto';
import { brokerType } from '../../generated/prisma/client';

@Injectable()
export class BrokerService {
  constructor(private prisma: PrismaService) {}

  async create(dto: CreateBrokerDto) {
    const existing = await this.prisma.broker.findUnique({
      where: { slug: dto.slug },
    });
    if (existing) throw new ConflictException('Slug already exists');

    return this.prisma.broker.create({ data: dto });
  }

  async findAll(search?: string, type?: brokerType) {
    return this.prisma.broker.findMany({
      where: {
        AND: [
          search ? { name: { contains: search, mode: 'insensitive' } } : {},
          type ? { broker_type: type } : {},
        ],
      },
      orderBy: { createdAt: 'desc' },
    });
  }

  async findOne(slug: string) {
    return this.prisma.broker.findUnique({ where: { slug } });
  }
}
