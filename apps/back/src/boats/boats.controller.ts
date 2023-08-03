import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { BoatsService } from './boats.service';
import { Prisma } from '@prisma/client';
import { Boat } from './interfaces/boats.interface';

@Controller('boats')
export class BoatsController {
  constructor(private readonly boatsService: BoatsService) {}

  @Post()
  create(@Body() createBoatDto: Prisma.BoatCreateInput): Promise<Boat> {
    return this.boatsService.create(createBoatDto);
  }

  @Get()
  findAll(): Promise<Boat[]> {
    return this.boatsService.findAll();
  }

  // ! weird
  @Get(':id')
  findOne(@Param('id') id: string): Promise<any> {
    return this.boatsService.findOne(+id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateBoatDto: Prisma.BoatUpdateInput,
  ): Promise<Boat> {
    return this.boatsService.update(+id, updateBoatDto);
  }

  @Delete(':id')
  delete(@Param('id') id: string): Promise<Boat> {
    return this.boatsService.delete(+id);
  }
}
