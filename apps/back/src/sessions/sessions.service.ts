import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from 'src/prisma.service';
import { CreateSessionDto } from './dto/create-session.dto';
import { sessionsSelector } from '../routes/interfaces/sessions.selector';
import { Session } from './interfaces/sessions.interface';

@Injectable()
export class SessionsService {
  constructor(private prisma: PrismaService) {}

  async create(createSessionDto: CreateSessionDto): Promise<Session> {
    const { rowersIds, boatId, clubId } = createSessionDto;

    const prismaSession = await this.prisma.session.create({
      data: {
        rowers: {
          create: rowersIds.map((id) => ({ rowerId: id })),
        },
        boatId,
        clubId,
      },
      select: sessionsSelector,
    });

    return {
      ...prismaSession,
      rowers: prismaSession.rowers.map((r) => r.rower),
    };
  }

  async findAll(): Promise<Session[]> {
    const prismaSessions = await this.prisma.session.findMany({
      select: sessionsSelector,
    });

    return prismaSessions.map((session) => ({
      ...session,
      rowers: session.rowers.map((r) => r.rower),
    }));
  }

  async findOne(id: number): Promise<Session> {
    const prismaSession = await this.prisma.session.findUnique({
      where: { id },
      select: sessionsSelector,
    });

    if (!prismaSession) {
      throw new Error(`Session with id ${id} not found`);
    }

    return {
      ...prismaSession,
      rowers: prismaSession.rowers.map((r) => r.rower),
    };
  }

  async update(
    id: number,
    updateSessionDto: Prisma.SessionUpdateInput,
  ): Promise<Session> {
    const prismaSession = await this.prisma.session.update({
      where: { id },
      data: updateSessionDto,
      select: sessionsSelector,
    });

    return {
      ...prismaSession,
      rowers: prismaSession.rowers.map((r) => r.rower),
    };
  }

  async delete(id: number): Promise<Session> {
    const prismaSession = await this.prisma.session.delete({
      where: { id },
      select: sessionsSelector,
    });

    return {
      ...prismaSession,
      rowers: prismaSession.rowers.map((r) => r.rower),
    };
  }
}
