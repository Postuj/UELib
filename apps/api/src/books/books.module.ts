import { Module } from '@nestjs/common';
import { CqrsModule } from '@nestjs/cqrs';
import { TypeOrmModule } from '@nestjs/typeorm';
import { UsersModule } from 'src/users/users.module';
import { BooksController } from './books.controller';
import { AuthorSchemaFactory } from './db/author/author-schema.factory';
import { AuthorSchema } from './db/author/author.schema';
import { BookEntityRepository } from './db/book/book-entity.repository';
import { BookSchemaFactory } from './db/book/book-schema.factory';
import { BookSchema } from './db/book/book.schema';
import { GenreSchemaFactory } from './db/genre/genre-schema.factory';
import { GenreSchema } from './db/genre/genre.schema';
import { BookDtoFactory } from './dto/book-dto.factory';
import { BooksQueryHandler } from './queries/books/books.handler';

const queryHandlers = [BooksQueryHandler];

@Module({
  imports: [
    CqrsModule,
    TypeOrmModule.forFeature([BookSchema, AuthorSchema, GenreSchema]),
    UsersModule,
  ],
  providers: [
    BookEntityRepository,
    BookSchemaFactory,
    AuthorSchemaFactory,
    GenreSchemaFactory,
    BookDtoFactory,
    ...queryHandlers,
  ],
  controllers: [BooksController],
})
export class BooksModule {}
