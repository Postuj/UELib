import { IQueryHandler, QueryHandler } from '@nestjs/cqrs';
import { BookEntityRepository } from 'src/books/db/book/book-entity.repository';
import { BookDtoFactory } from 'src/books/dto/book-dto.factory';
import { BookDto } from 'src/books/dto/books-response.dto';
import { BooksQuery } from './books.query';

@QueryHandler(BooksQuery)
export class BooksQueryHandler implements IQueryHandler<BooksQuery> {
  constructor(
    private readonly bookRepo: BookEntityRepository,
    private readonly bookDtoFactory: BookDtoFactory,
  ) {}

  async execute(query: BooksQuery): Promise<BookDto[]> {
    const { titleOrAuthor } = query;

    const bookEntities = titleOrAuthor
      ? await this.bookRepo.findManyByTitleOrAuthor(titleOrAuthor)
      : await this.bookRepo.findAll();

    return bookEntities.map(this.bookDtoFactory.createFromEntity);
  }
}
