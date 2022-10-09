import { Injectable } from '@nestjs/common';
import { Book } from '../../entities/book/book.entity';
import { EntitySchemaFactory } from '../../../database/entity-schema.factory';
import { BookSchema } from './book.schema';
import { AuthorSchemaFactory } from '../author/author-schema.factory';
import { GenreSchemaFactory } from '../genre/genre-schema.factory';

@Injectable()
export class BookSchemaFactory implements EntitySchemaFactory<BookSchema, Book> {
  constructor(
    private readonly authorSchemaFactory: AuthorSchemaFactory,
    private readonly genreSchemaFactory: GenreSchemaFactory,
  ) {}

  create(entity: Book): BookSchema {
    return {
      id: entity.getId(),
      title: entity.getTitle(),
      description: entity.getDescription(),
      authorId: entity.getAuthor().getId(),
      genreId: entity.getGenre().getId(),
    } as BookSchema;
  }
  createFromSchema(entitySchema: BookSchema): Book {
    const author = this.authorSchemaFactory.createFromSchema(entitySchema.author);
    const genre = this.genreSchemaFactory.createFromSchema(entitySchema.genre);

    return new Book(
      entitySchema.id,
      entitySchema.title,
      author,
      genre,
      entitySchema.description,
      entitySchema.publishedAt,
      entitySchema.registeredAt,
    );
  }
}
