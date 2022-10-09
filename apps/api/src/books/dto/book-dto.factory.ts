import { Injectable } from '@nestjs/common';
import { BaseDtoFactory } from 'src/common/base-dto.factory';
import { Book } from '../entities/book/book.entity';
import { BookDto } from './books-response.dto';

@Injectable()
export class BookDtoFactory implements BaseDtoFactory<Book, BookDto> {
  createFromEntity(entity: Book): BookDto {
    const authorEntity = entity.getAuthor();
    const genreEntity = entity.getGenre();
    return {
      id: entity.getId(),
      title: entity.getTitle(),
      description: entity.getDescription(),
      publishedDate: entity.getPublishedAt(),
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
