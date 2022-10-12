import { Injectable } from '@nestjs/common';
import { Genre } from 'src/books/entities/genre/genre.entity';
import { EntitySchemaFactory } from 'src/database/entity-schema.factory';
import { GenreSchema } from './genre.schema';

@Injectable()
export class GenreSchemaFactory implements EntitySchemaFactory<GenreSchema, Genre> {
  create(entity: Genre): GenreSchema {
    return {
      id: entity.getId(),
      name: entity.getName(),
      createdAt: entity.getRegisteredAt(),
      books: [],
    } as GenreSchema;
  }
  createFromSchema(entitySchema: GenreSchema): Genre {
    return new Genre(entitySchema.id, entitySchema.name, entitySchema.createdAt);
  }
}
