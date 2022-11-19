import { Entity } from 'src/core/entity';
import { Book } from '../book/book.entity';

export class BookWithAvailability extends Entity {
  constructor(
    private book: Book,
    private isAvailable: boolean,
    private plannedDateOfReturn?: Date,
  ) {
    super();
  }

  getBook(): Book {
    return this.book;
  }

  getIsAvailable(): boolean {
    return this.isAvailable;
  }

  getPlannedDateOfReturn(): Date | null | undefined {
    return this.plannedDateOfReturn;
  }
}
