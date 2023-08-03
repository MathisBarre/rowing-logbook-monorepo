import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { SessionsService } from './sessions.service';
import { Prisma } from '@prisma/client';
import { CreateSessionDto } from './dto/create-session.dto';
import { Session } from './interfaces/sessions.interface';

@Controller('sessions')
export class SessionsController {
  constructor(private readonly sessionsService: SessionsService) {}

  @Post()
  create(@Body() createSessionDto: CreateSessionDto): Promise<Session> {
    return this.sessionsService.create(createSessionDto);
  }

  @Get()
  findAll(): Promise<Session[]> {
    return this.sessionsService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string): Promise<Session> {
    return this.sessionsService.findOne(+id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateSessionDto: Prisma.SessionUpdateInput,
  ): Promise<Session> {
    return this.sessionsService.update(+id, updateSessionDto);
  }

  @Delete(':id')
  delete(@Param('id') id: string): Promise<Session> {
    return this.sessionsService.delete(+id);
  }
}
