import { BookDto } from '../book/books-response.dto';

export class BookWithAvailabilityDto extends BookDto {
  isAvailable: boolean;
  plannedDateOfReturn?: Date;
}
