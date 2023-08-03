import { Test, TestingModule } from '@nestjs/testing';
import { RowersService } from './rowers.service';

describe('RowersService', () => {
  let service: RowersService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [RowersService],
    }).compile();

    service = module.get<RowersService>(RowersService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
