import { Injectable } from '@nestjs/common';
import { Author } from 'src/books/entities/author/author.entity';
import { EntitySchemaFactory } from '../../../database/entity-schema.factory';
import { AuthorSchema } from './author.schema';

@Injectable()
export class AuthorSchemaFactory implements EntitySchemaFactory<AuthorSchema, Author> {
  create(entity: Author): AuthorSchema {
    return {
      id: entity.getId(),
      name: entity.getName(),
      surname: entity.getSurname(),
      registeredAt: entity.getRegisteredAt(),
      books: [],
    };
  }
  createFromSchema(entitySchema: AuthorSchema): Author {
    return new Author(
      entitySchema.id,
      entitySchema.name,
      entitySchema.surname,
      entitySchema.registeredAt,
    );
  }
}
