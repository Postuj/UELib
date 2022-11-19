import { NotFoundException } from '@nestjs/common';
import { IQueryHandler, QueryHandler } from '@nestjs/cqrs';
import { BookEntityRepository } from 'src/books/db/book/book-entity.repository';
import { BookWithAvailability } from 'src/books/entities/book-with-availability/book-with-availability.entity';
import { BookWithAvailabilityFactory } from 'src/books/entities/book-with-availability/book-with-availability.factory';
import { Book } from 'src/books/entities/book/book.entity';
import { BookWithAvailabilityQuery } from './book-with-availability.query';

@QueryHandler(BookWithAvailabilityQuery)
export class BookWithAvailabilityQueryHandler implements IQueryHandler<BookWithAvailabilityQuery> {
  constructor(
    private readonly booksRepo: BookEntityRepository,
    private readonly bookWithAvailabilityFactory: BookWithAvailabilityFactory,
  ) {}

  async execute(query: BookWithAvailabilityQuery): Promise<BookWithAvailability> {
    const { id } = query;

    const book = await this.getBook(id);
    const bookWithAvailability = await this.bookWithAvailabilityFactory.createFromBook(book);

    return bookWithAvailability;
  }

  private async getBook(bookId: string): Promise<Book> {
    const book = await this.booksRepo.findOneById(bookId);
    if (!book) throw new NotFoundException('Book not found');
    return book;
  }
}
