import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { ClubsService } from './clubs.service';
import { Club, Prisma } from '@prisma/client';

@Controller('clubs')
export class ClubsController {
  constructor(private readonly clubsService: ClubsService) {}

  @Post()
  create(@Body() createClubDto: Prisma.ClubCreateInput): Promise<Club> {
    return this.clubsService.create(createClubDto);
  }

  @Get()
  findAll(): Promise<Club[]> {
    return this.clubsService.findAll();
  }

  //!weird
  @Get(':id')
  findOne(@Param('id') id: string): Promise<any> {
    return this.clubsService.findOne(+id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateClubDto: Prisma.ClubUpdateInput,
  ): Promise<Club> {
    return this.clubsService.update(+id, updateClubDto);
  }

  @Delete(':id')
  delete(@Param('id') id: string): Promise<Club> {
    return this.clubsService.delete(+id);
  }
}
