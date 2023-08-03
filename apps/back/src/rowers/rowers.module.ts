import { Module } from '@nestjs/common';
import { RowersService } from './rowers.service';
import { RowersController } from './rowers.controller';
import { PrismaService } from 'src/prisma.service';

@Module({
  controllers: [RowersController],
  providers: [RowersService, PrismaService],
})
export class RowersModule {}
