import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from 'src/prisma.service';

@Injectable()
export class ClubsService {
  constructor(private prisma: PrismaService) {}

  create(createClubDto: Prisma.ClubCreateInput) {
    return this.prisma.club.create({ data: createClubDto });
  }

  findAll() {
    return this.prisma.club.findMany();
  }

  findOne(id: number) {
    return this.prisma.club.findUnique({ where: { id } });
  }

  update(id: number, updateClubDto: Prisma.ClubUpdateInput) {
    return this.prisma.club.update({ where: { id }, data: updateClubDto });
  }

  delete(id: number) {
    return this.prisma.club.delete({ where: { id } });
  }
}
