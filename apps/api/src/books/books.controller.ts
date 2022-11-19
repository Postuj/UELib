import { Body, Controller, Get, HttpCode, HttpStatus, Param, Post, Query } from '@nestjs/common';
import { CommandBus, QueryBus } from '@nestjs/cqrs';
import { GetUser } from '../users/decorators/user.decorator';
import { User } from '../users/entities/user/user.entity';
import { BorrowBookCommand } from './commands/borrow-book/borrow-book.command';
import { BookWithAvailabilityDtoFactory } from './dto/book-with-availability/book-with-availability-dto.factory';
import { BookWithAvailabilityDto } from './dto/book-with-availability/book-with-availability-response.dto';
import { BookDtoFactory } from './dto/book/book-dto.factory';
import { BookDto } from './dto/book/books-response.dto';
import { BorrowBookRequestDto } from './dto/borrow-book/borrow-book-request.dto';
import { BookWithAvailability } from './entities/book-with-availability/book-with-availability.entity';
import { Book } from './entities/book/book.entity';
import { BookWithAvailabilityQuery } from './queries/book-with-availability/book-with-availability.query';
import { BooksQuery } from './queries/books/books.query';

@Controller('books')
export class BooksController {
  constructor(
    private readonly queryBus: QueryBus,
    private readonly commandBus: CommandBus,
    private readonly bookDtoFactory: BookDtoFactory,
    private readonly bookWithAvailabilityDtoFactory: BookWithAvailabilityDtoFactory,
  ) {}

  @HttpCode(HttpStatus.OK)
  @Get('')
  async getBooks(@Query('titleOrAuthor') titleOrAuthor?: string): Promise<BookDto[]> {
    const books = await this.queryBus.execute<BooksQuery, Book[]>(new BooksQuery(titleOrAuthor));
    return books.map((book) => this.bookDtoFactory.createFromEntity(book));
  }

  @HttpCode(HttpStatus.OK)
  @Get(':id/with-availability')
  async getBookWithAvailability(@Param('id') id: string): Promise<BookWithAvailabilityDto> {
    const bookWithAvailability = await this.queryBus.execute<
      BookWithAvailabilityQuery,
      BookWithAvailability
    >(new BookWithAvailabilityQuery(id));
    return this.bookWithAvailabilityDtoFactory.createFromEntity(bookWithAvailability);
  }

  @HttpCode(HttpStatus.OK)
  @Post(':id/borrow')
  borrowBook(
    @GetUser() user: User,
    @Param('id') id: string,
    @Body() borrowBookDto: BorrowBookRequestDto,
  ): Promise<void> {
    return this.commandBus.execute<BorrowBookCommand, void>(
      new BorrowBookCommand(user, id, borrowBookDto.plannedDateOfReturn),
    );
  }
}
