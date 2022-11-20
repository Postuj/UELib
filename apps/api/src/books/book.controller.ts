import { Body, Controller, Get, HttpCode, HttpStatus, Param, Post } from '@nestjs/common';
import { CommandBus, QueryBus } from '@nestjs/cqrs';
import { GetUser } from 'src/users/decorators/user.decorator';
import { User } from 'src/users/entities/user/user.entity';
import { BorrowBookCommand } from './commands/borrow-book/borrow-book.command';
import { BookWithAvailabilityDtoFactory } from './dto/book-with-availability/book-with-availability-dto.factory';
import { BookWithAvailabilityDto } from './dto/book-with-availability/book-with-availability.dto';
import { BorrowBookRequestDto } from './dto/borrow-book/borrow-book-request.dto';
import { BookWithAvailability } from './entities/book-with-availability/book-with-availability.entity';
import { BookWithAvailabilityQuery } from './queries/book-with-availability/book-with-availability.query';

@Controller('books/:id')
export class BookController {
  constructor(
    private readonly queryBus: QueryBus,
    private readonly commandBus: CommandBus,
    private readonly bookWithAvailabilityDtoFactory: BookWithAvailabilityDtoFactory,
  ) {}

  @HttpCode(HttpStatus.OK)
  @Get('with-availability')
  async getBookWithAvailability(@Param('id') id: string): Promise<BookWithAvailabilityDto> {
    const bookWithAvailability = await this.queryBus.execute<
      BookWithAvailabilityQuery,
      BookWithAvailability
    >(new BookWithAvailabilityQuery(id));
    return this.bookWithAvailabilityDtoFactory.createFromEntity(bookWithAvailability);
  }

  @HttpCode(HttpStatus.OK)
  @Post('borrow')
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
