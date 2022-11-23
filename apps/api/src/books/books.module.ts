import { Module } from '@nestjs/common';
import { CqrsModule } from '@nestjs/cqrs';
import { TypeOrmModule } from '@nestjs/typeorm';
import { UsersModule } from 'src/users/users.module';
import { BookController } from './book.controller';
import { BooksController } from './books.controller';
import { BorrowBookHandler } from './commands/borrow-book/borrow-book.handler';
import { AuthorSchemaFactory } from './db/author/author-schema.factory';
import { AuthorSchema } from './db/author/author.schema';
import { BookEntityRepository } from './db/book/book-entity.repository';
import { BookSchemaFactory } from './db/book/book-schema.factory';
import { BookSchema } from './db/book/book.schema';
import { BorrowedBookEntityRepository } from './db/borrowed-books/borrowed-book-entity.repository';
import { BorrowedBookSchemaFactory } from './db/borrowed-books/borrowed-book-schema.factory';
import { BorrowedBookSchema } from './db/borrowed-books/borrowed-book.schema';
import { GenreSchemaFactory } from './db/genre/genre-schema.factory';
import { GenreSchema } from './db/genre/genre.schema';
import { BookWithAvailabilityDtoFactory } from './dto/book-with-availability/book-with-availability-dto.factory';
import { BookDtoFactory } from './dto/book/book-dto.factory';
import { BorrowedBookDtoFactory } from './dto/borrow-book/borrowed-book-dto.factory';
import { BookWithAvailabilityFactory } from './entities/book-with-availability/book-with-availability.factory';
import { BorrowedBookFactory } from './entities/borrowed-book/borrowed-book.factory';
import { BookBorrowedHandler } from './events/book-borrowed/book-borrowed.handler';
import { BookWithAvailabilityQueryHandler } from './queries/book-with-availability/book-with-availability.handler';
import { BooksQueryHandler } from './queries/books/books.handler';
import { CurrentlyBorrowedBooksHandler } from './queries/currently-borrowed-books/currently-borrowed-books.handler';

const queryHandlers = [
  BooksQueryHandler,
  BookWithAvailabilityQueryHandler,
  CurrentlyBorrowedBooksHandler,
];
const commandHandlers = [BorrowBookHandler];
const eventHandlers = [BookBorrowedHandler];

@Module({
  imports: [
    CqrsModule,
    TypeOrmModule.forFeature([BookSchema, AuthorSchema, GenreSchema, BorrowedBookSchema]),
    UsersModule,
  ],
  providers: [
    BookEntityRepository,
    BookSchemaFactory,
    BookDtoFactory,
    BorrowedBookEntityRepository,
    BorrowedBookSchemaFactory,
    BorrowedBookFactory,
    BorrowedBookDtoFactory,
    AuthorSchemaFactory,
    GenreSchemaFactory,
    BookWithAvailabilityFactory,
    BookWithAvailabilityDtoFactory,
    ...queryHandlers,
    ...commandHandlers,
    ...eventHandlers,
  ],
  controllers: [BooksController, BookController],
})
export class BooksModule {}
