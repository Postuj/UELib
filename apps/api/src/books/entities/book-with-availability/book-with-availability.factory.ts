import { Injectable } from '@nestjs/common';
import { BorrowedBookEntityRepository } from 'src/books/db/borrowed-books/borrowed-book-entity.repository';
import { EntityFactory } from 'src/core/entity.factory';
import { Book } from '../book/book.entity';
import { BookWithAvailability } from './book-with-availability.entity';

@Injectable()
export class BookWithAvailabilityFactory implements EntityFactory<BookWithAvailability> {
  constructor(private readonly borrowedBookRepo: BorrowedBookEntityRepository) {}

  create(book: Book, isAvailable: boolean, plannedDateOfReturn?: Date): BookWithAvailability {
    return new BookWithAvailability(book, isAvailable, plannedDateOfReturn);
  }

  async createFromBook(book: Book): Promise<BookWithAvailability> {
    const borrowedBooks = await this.borrowedBookRepo.findActiveBookBorrowings(book.getId());
    const borrowedBook = borrowedBooks.length > 0 ? borrowedBooks[0] : null;

    const isAvailable = borrowedBook == null;
    const plannedDateOfReturn = borrowedBook == null ? null : borrowedBook.getPlannedDateOfReturn();
    return new BookWithAvailability(book, isAvailable, plannedDateOfReturn)
  }
}
