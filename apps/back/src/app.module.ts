import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ConfigModule } from '@nestjs/config';
import { SessionsModule } from './sessions/sessions.module';
import { PrismaService } from './prisma.service';
import { BoatsModule } from './boats/boats.module';
import { RowersModule } from './rowers/rowers.module';
import { ClubsModule } from './clubs/clubs.module';

@Module({
  imports: [
    ConfigModule.forRoot(),
    SessionsModule,
    BoatsModule,
    RowersModule,
    ClubsModule,
  ],
  controllers: [AppController],
  providers: [AppService, PrismaService],
})
export class AppModule {}
