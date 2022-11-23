import { Injectable } from '@nestjs/common';
import { BorrowedBook } from 'src/books/entities/borrowed-book/borrowed-book.entity';
import { DtoFactory } from 'src/core/dto.factory';
import { BorrowedBookDto } from './borrowed-book.dto';
import { BookDtoFactory } from '../book/book-dto.factory';

@Injectable()
export class BorrowedBookDtoFactory implements DtoFactory<BorrowedBook, BorrowedBookDto> {
  constructor(private readonly bookDtoFactory: BookDtoFactory) {}

  createFromEntity(entity: BorrowedBook): BorrowedBookDto {
    const bookDto = this.bookDtoFactory.createFromEntity(entity.getBook());

    return {
      ...bookDto,
      borrowedAt: entity.getBorrowedAt(),
      returnedAt: entity.getReturnedAt(),
      plannedDateOfReturn: entity.getPlannedDateOfReturn(),
    };
  }
}
