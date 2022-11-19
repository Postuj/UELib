import { IQueryHandler, QueryHandler } from '@nestjs/cqrs';
import { BookEntityRepository } from 'src/books/db/book/book-entity.repository';
import { Book } from 'src/books/entities/book/book.entity';
import { BooksQuery } from './books.query';

@QueryHandler(BooksQuery)
export class BooksQueryHandler implements IQueryHandler<BooksQuery> {
  constructor(private readonly bookRepo: BookEntityRepository) {}

  async execute(query: BooksQuery): Promise<Book[]> {
    const { titleOrAuthor } = query;

    const bookEntities = titleOrAuthor
      ? await this.bookRepo.findManyByTitleOrAuthor(titleOrAuthor)
      : await this.bookRepo.findAll();

    return bookEntities;
  }
}
