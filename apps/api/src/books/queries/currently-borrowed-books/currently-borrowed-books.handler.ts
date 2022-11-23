import { IQueryHandler, QueryHandler } from '@nestjs/cqrs';
import { BorrowedBookEntityRepository } from 'src/books/db/borrowed-books/borrowed-book-entity.repository';
import { BorrowedBook } from 'src/books/entities/borrowed-book/borrowed-book.entity';
import { CurrentlyBorrowedBooksQuery } from './currently-borrowed-books.query';

@QueryHandler(CurrentlyBorrowedBooksQuery)
export class CurrentlyBorrowedBooksHandler implements IQueryHandler<CurrentlyBorrowedBooksQuery> {
  constructor(private readonly borrowedBooksRepo: BorrowedBookEntityRepository) {}

  async execute(query: CurrentlyBorrowedBooksQuery): Promise<BorrowedBook[]> {
    const { userId } = query;

    const bookEntities = this.borrowedBooksRepo.findUserActiveBookBorrowings(userId);

    return bookEntities;
  }
}
