import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { RowersService } from './rowers.service';
import { Prisma } from '@prisma/client';
import { Rower } from './interfaces/rowers.interface';

@Controller('rowers')
export class RowersController {
  constructor(private readonly rowersService: RowersService) {}

  @Post()
  create(@Body() createRowerDto: Prisma.RowerCreateInput): Promise<Rower> {
    return this.rowersService.create(createRowerDto);
  }

  @Get()
  findAll(): Promise<Rower[]> {
    return this.rowersService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string): Promise<Rower> {
    return this.rowersService.findOne(+id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateRowerDto: Prisma.RowerUpdateInput,
  ): Promise<Rower> {
    return this.rowersService.update(+id, updateRowerDto);
  }

  @Delete(':id')
  delete(@Param('id') id: string): Promise<Rower> {
    return this.rowersService.delete(+id);
  }
}
