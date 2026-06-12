import {
  Injectable,
  ConflictException,
  NotFoundException,
} from '@nestjs/common';
import { PrismaService } from '../../prisma/prisma.service';
import { CreateBrokerDto } from './dto/create-broker.dto';
import { UpdateBrokerDto } from './dto/update-broker.dto';
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

  async update(id: number, dto: UpdateBrokerDto) {
    const existing = await this.prisma.broker.findUnique({ where: { id } });
    if (!existing) throw new NotFoundException('Broker not found');

    return this.prisma.broker.update({ where: { id }, data: dto });
  }

  async remove(id: number) {
    const existing = await this.prisma.broker.findUnique({ where: { id } });
    if (!existing) throw new NotFoundException('Broker not found');

    await this.prisma.broker.delete({ where: { id } });
    return { message: 'Deleted successfully' };
  }
}
