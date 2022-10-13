import { EventsHandler, IEventHandler } from '@nestjs/cqrs';
import { BookEntityRepository } from 'src/books/db/book/book-entity.repository';
import { BorrowedBookFactory } from 'src/books/entities/borrowed-book/borrowed-book.factory';
import { UserEntityRepository } from 'src/users/db/user/user-entity.repository';
import { BookBorrowedEvent } from './book-borrowed.event';

@EventsHandler(BookBorrowedEvent)
export class BookBorrowedHandler implements IEventHandler<BookBorrowedEvent> {
  constructor(
    private readonly usersRepo: UserEntityRepository,
    private readonly booksRepo: BookEntityRepository,
    private readonly borrowedBookFactory: BorrowedBookFactory,
  ) {}

  async handle(event: BookBorrowedEvent): Promise<void> {
    const { userId, bookId, plannedReturnDate } = event;
    const book = await this.booksRepo.findOneById(bookId);
    const user = await this.usersRepo.findOneById(userId);

    await this.borrowedBookFactory.create(book, user, plannedReturnDate);
  }
}
