import { BaseEntity } from '../../../core/base.entity';
import { Book } from '../book/book.entity';

export class Genre extends BaseEntity {
  constructor(
    id: string,
    private readonly name: string,
    private readonly registeredAt: Date = new Date(),
    private readonly books: Book[] = [],
  ) {
    super(id);
  }

  getName(): string {
    return this.name;
  }

  getRegisteredAt(): Date {
    return this.registeredAt;
  }

  getBooks(): Book[] {
    return this.books;
  }
}
