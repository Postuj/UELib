import { Body, Controller, Get, HttpCode, HttpStatus, Param, Post, Query } from '@nestjs/common';
import { CommandBus, QueryBus } from '@nestjs/cqrs';
import { GetUser } from '../users/decorators/user.decorator';
import { User } from '../users/entities/user/user.entity';
import { BorrowBookCommand } from './commands/borrow-book/borrow-book.command';
import { BookDto } from './dto/book/books-response.dto';
import { BorrowBookRequestDto } from './dto/borrow-book/borrow-book-request.dto';
import { BooksQuery } from './queries/books/books.query';

@Controller('books')
export class BooksController {
  constructor(private readonly queryBus: QueryBus, private readonly commandBus: CommandBus) {}

  @HttpCode(HttpStatus.OK)
  @Get('')
  getBooks(@Query('titleOrAuthor') titleOrAuthor?: string): Promise<BookDto[]> {
    return this.queryBus.execute<BooksQuery, BookDto[]>(new BooksQuery(titleOrAuthor));
  }

  @HttpCode(HttpStatus.OK)
  @Post('borrow/:id')
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
