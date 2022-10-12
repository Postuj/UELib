import { Module } from '@nestjs/common';
import { CqrsModule } from '@nestjs/cqrs';
import { TypeOrmModule } from '@nestjs/typeorm';
import { UsersModule } from 'src/users/users.module';
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
import { BookDtoFactory } from './dto/book/book-dto.factory';
import { BorrowedBookFactory } from './entities/borrowed-book/borrowed-book.factory';
import { BookBorrowedHandler } from './events/book-borrowed/book-borrowed.handler';
import { BooksQueryHandler } from './queries/books/books.handler';

const queryHandlers = [BooksQueryHandler];
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
    AuthorSchemaFactory,
    GenreSchemaFactory,
    ...queryHandlers,
    ...commandHandlers,
    ...eventHandlers,
  ],
  controllers: [BooksController],
})
export class BooksModule {}
