import { Controller, Get, HttpCode, HttpStatus, Query } from '@nestjs/common';
import { CommandBus, QueryBus } from '@nestjs/cqrs';
import { GetUser } from 'src/users/decorators/user.decorator';
import { User } from 'src/users/entities/user/user.entity';
import { BookWithAvailabilityDtoFactory } from './dto/book-with-availability/book-with-availability-dto.factory';
import { BookDtoFactory } from './dto/book/book-dto.factory';
import { BookDto } from './dto/book/book.dto';
import { BorrowedBookDtoFactory } from './dto/borrow-book/borrowed-book-dto.factory';
import { Book } from './entities/book/book.entity';
import { BorrowedBook } from './entities/borrowed-book/borrowed-book.entity';
import { BooksQuery } from './queries/books/books.query';
import { CurrentlyBorrowedBooksQuery } from './queries/currently-borrowed-books/currently-borrowed-books.query';

@Controller('books')
export class BooksController {
  constructor(
    private readonly queryBus: QueryBus,
    private readonly bookDtoFactory: BookDtoFactory,
    private readonly borrowedBookDtoFactory: BorrowedBookDtoFactory,
  ) {}

  @HttpCode(HttpStatus.OK)
  @Get('')
  async getBooks(@Query('titleOrAuthor') titleOrAuthor?: string): Promise<BookDto[]> {
    const books = await this.queryBus.execute<BooksQuery, Book[]>(new BooksQuery(titleOrAuthor));
    return books.map((book) => this.bookDtoFactory.createFromEntity(book));
  }

  @HttpCode(HttpStatus.OK)
  @Get('currently-borrowed')
  async getUserCurrentlyBorrowedBooks(@GetUser() user: User): Promise<BookDto[]> {
    const borrowedBooks = await this.queryBus.execute<CurrentlyBorrowedBooksQuery, BorrowedBook[]>(
      new CurrentlyBorrowedBooksQuery(user.getId()),
    );
    return borrowedBooks.map((book) => this.borrowedBookDtoFactory.createFromEntity(book));
  }
}
