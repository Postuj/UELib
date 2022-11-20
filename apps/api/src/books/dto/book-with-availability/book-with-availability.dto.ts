import { BookDto } from '../book/book.dto';

export class BookWithAvailabilityDto extends BookDto {
  isAvailable: boolean;
  plannedDateOfReturn?: Date;
}
