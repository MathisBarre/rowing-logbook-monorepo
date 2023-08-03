import { Test, TestingModule } from '@nestjs/testing';
import { BoatsController } from './boats.controller';
import { BoatsService } from './boats.service';

describe('BoatsController', () => {
  let controller: BoatsController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [BoatsController],
      providers: [BoatsService],
    }).compile();

    controller = module.get<BoatsController>(BoatsController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
