import { Test, TestingModule } from '@nestjs/testing';
import { RowersController } from './rowers.controller';
import { RowersService } from './rowers.service';

describe('RowersController', () => {
  let controller: RowersController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [RowersController],
      providers: [RowersService],
    }).compile();

    controller = module.get<RowersController>(RowersController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
