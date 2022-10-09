import { Controller, Get, HttpCode, HttpStatus, Query } from '@nestjs/common';
import { QueryBus } from '@nestjs/cqrs';
import { BookDto } from './dto/books-response.dto';
import { BooksQuery } from './queries/books/books.query';

@Controller('books')
export class BooksController {
  constructor(private readonly queryBus: QueryBus) {}

  @HttpCode(HttpStatus.OK)
  @Get('')
  getBooks(@Query('titleOrAuthor') titleOrAuthor?: string): Promise<BookDto[]> {
    return this.queryBus.execute<BooksQuery, BookDto[]>(new BooksQuery(titleOrAuthor));
  }
}
