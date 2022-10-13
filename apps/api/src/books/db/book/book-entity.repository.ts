import { Injectable, Logger } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Book } from 'src/books/entities/book/book.entity';
import { BaseEntityRepository } from 'src/database/base-entity.repository';
import { Repository } from 'typeorm';
import { BookSchemaFactory } from './book-schema.factory';
import { BookSchema } from './book.schema';

@Injectable()
export class BookEntityRepository extends BaseEntityRepository<BookSchema, Book> {
  private readonly logger = new Logger(BookEntityRepository.name);

  constructor(
    @InjectRepository(BookSchema)
    booksRepo: Repository<BookSchema>,
    bookSchemaFactory: BookSchemaFactory,
  ) {
    super(booksRepo, bookSchemaFactory);
  }

  async findManyByTitleOrAuthor(titleOrAuthor: string): Promise<Book[]> {
    const bookSchemas = await this.entityRepo
      .createQueryBuilder('book')
      .innerJoinAndSelect('book.author', 'author', 'author.id = book.author_id')
      .innerJoinAndSelect('book.genre', 'genre', 'genre.id = book.genre_id')
      .where("lower(book.title) LIKE '%' || :phrase || '%'")
      .orWhere("lower(author.name) LIKE '%' || :phrase || '%'")
      .orWhere("lower(author.surname) LIKE '%' || :phrase || '%'")
      .orderBy('book.title', 'ASC')
      .setParameter('phrase', titleOrAuthor.toLowerCase())
      .getMany();
    return bookSchemas.map((bookDocument) =>
      this.entitySchemaFactory.createFromSchema(bookDocument),
    );
  }
}
