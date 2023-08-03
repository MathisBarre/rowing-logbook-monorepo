import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from 'src/prisma.service';
import { boatSelector } from './selectors/boats.selector';

@Injectable()
export class BoatsService {
  constructor(private prisma: PrismaService) {}

  create(createBoatDto: Prisma.BoatCreateInput) {
    return this.prisma.boat.create({
      data: createBoatDto,
      select: boatSelector,
    });
  }

  findAll() {
    return this.prisma.boat.findMany({ select: boatSelector });
  }

  findOne(id: number) {
    return this.prisma.boat.findUnique({ where: { id }, select: boatSelector });
  }

  update(id: number, updateBoatDto: Prisma.BoatUpdateInput) {
    return this.prisma.boat.update({
      where: { id },
      data: updateBoatDto,
      select: boatSelector,
    });
  }

  delete(id: number) {
    return this.prisma.boat.delete({ where: { id }, select: boatSelector });
  }
}
