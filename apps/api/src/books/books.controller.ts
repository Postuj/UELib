import { Controller, Get, HttpCode, HttpStatus, Query } from '@nestjs/common';
import { CommandBus, QueryBus } from '@nestjs/cqrs';
import { BookWithAvailabilityDtoFactory } from './dto/book-with-availability/book-with-availability-dto.factory';
import { BookDtoFactory } from './dto/book/book-dto.factory';
import { BookDto } from './dto/book/book.dto';
import { Book } from './entities/book/book.entity';
import { BooksQuery } from './queries/books/books.query';

@Controller('books')
export class BooksController {
  constructor(
    private readonly queryBus: QueryBus,
    private readonly bookDtoFactory: BookDtoFactory,
  ) {}

  @HttpCode(HttpStatus.OK)
  @Get('')
  async getBooks(@Query('titleOrAuthor') titleOrAuthor?: string): Promise<BookDto[]> {
    const books = await this.queryBus.execute<BooksQuery, Book[]>(new BooksQuery(titleOrAuthor));
    return books.map((book) => this.bookDtoFactory.createFromEntity(book));
  }
}
