import { Injectable } from '@nestjs/common';
import { DtoFactory } from 'src/core/dto.factory';
import { Book } from '../../entities/book/book.entity';
import { BookDto } from './books-response.dto';

@Injectable()
export class BookDtoFactory implements DtoFactory<Book, BookDto> {
  createFromEntity(entity: Book): BookDto {
    const authorEntity = entity.getAuthor();
    const genreEntity = entity.getGenre();
    return {
      id: entity.getId(),
      title: entity.getTitle(),
      description: entity.getDescription(),
      publishedAt: entity.getPublishedAt(),
      author: {
        id: authorEntity.getId(),
        name: authorEntity.getName(),
        surname: authorEntity.getSurname(),
      },
      genre: {
        id: genreEntity.getId(),
        name: genreEntity.getName(),
      },
    };
  }
}
