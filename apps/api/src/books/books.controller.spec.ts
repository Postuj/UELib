import { CqrsModule } from '@nestjs/cqrs';
import { Test, TestingModule } from '@nestjs/testing';
import { BooksController } from './books.controller';
import { BookWithAvailabilityDtoFactory } from './dto/book-with-availability/book-with-availability-dto.factory';
import { BookDtoFactory } from './dto/book/book-dto.factory';

describe('BooksController', () => {
  let controller: BooksController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      imports: [CqrsModule],
      providers: [BookDtoFactory, BookWithAvailabilityDtoFactory],
      controllers: [BooksController],
    }).compile();

    controller = module.get<BooksController>(BooksController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
