import { IQueryHandler, QueryHandler } from '@nestjs/cqrs';
import { BorrowedBookEntityRepository } from 'src/books/db/borrowed-books/borrowed-book-entity.repository';
import { BorrowedBook } from 'src/books/entities/borrowed-book/borrowed-book.entity';
import { BorrowingHistoryQuery } from './borrowing-history.query';

@QueryHandler(BorrowingHistoryQuery)
export class BorrowingHistoryHandler implements IQueryHandler<BorrowingHistoryQuery> {
  constructor(private readonly borrowedBooksRepo: BorrowedBookEntityRepository) {}

  async execute(query: BorrowingHistoryQuery): Promise<BorrowedBook[]> {
    const { userId } = query;

    const bookEntities = this.borrowedBooksRepo.findUserPastBookBorrowings(userId);

    return bookEntities;
  }
}
