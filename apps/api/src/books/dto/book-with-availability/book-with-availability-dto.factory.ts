import { Injectable } from '@nestjs/common';
import { BookWithAvailability } from 'src/books/entities/book-with-availability/book-with-availability.entity';
import { DtoFactory } from 'src/core/dto.factory';
import { BookDtoFactory } from '../book/book-dto.factory';
import { BookWithAvailabilityDto } from './book-with-availability-response.dto';

@Injectable()
export class BookWithAvailabilityDtoFactory
  implements DtoFactory<BookWithAvailability, BookWithAvailabilityDto>
{
  constructor(private readonly bookDtoFactory: BookDtoFactory) {}

  createFromEntity(entity: BookWithAvailability): BookWithAvailabilityDto {
    return {
      ...this.bookDtoFactory.createFromEntity(entity.getBook()),
      isAvailable: entity.getIsAvailable(),
      plannedDateOfReturn: entity.getPlannedDateOfReturn(),
    };
  }
}
