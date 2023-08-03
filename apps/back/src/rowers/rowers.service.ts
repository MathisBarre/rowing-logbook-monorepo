import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from 'src/prisma.service';
import { rowersSelector } from './selectors/rowers.selector';
import { Rower } from './interfaces/rowers.interface';

@Injectable()
export class RowersService {
  constructor(private readonly prisma: PrismaService) {}

  create(createRowerDto: Prisma.RowerCreateInput) {
    return this.prisma.rower.create({
      data: createRowerDto,
      select: rowersSelector,
    });
  }

  findAll() {
    return this.prisma.rower.findMany({ select: rowersSelector });
  }

  async findOne(id: number): Promise<Rower> {
    const rower = await this.prisma.rower.findUnique({
      where: {
        id: id,
      },
      select: rowersSelector,
    });

    if (!rower) {
      throw new Error(`Rower with id ${id} not found`);
    }

    return rower;
  }

  update(id: number, updateRowerDto: Prisma.RowerUpdateInput) {
    return this.prisma.rower.update({
      where: {
        id: id,
      },
      data: updateRowerDto,
      select: rowersSelector,
    });
  }

  delete(id: number) {
    return this.prisma.rower.delete({
      where: {
        id: id,
      },
      select: rowersSelector,
    });
  }
}
