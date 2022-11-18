import { BaseEntity } from '../../../core/base.entity';
import { Book } from '../book/book.entity';

export class Author extends BaseEntity {
  constructor(
    id: string,
    private readonly name: string,
    private readonly surname: string,
    private readonly registeredAt: Date = new Date(),
    private readonly books: Book[] = [],
  ) {
    super(id);
  }

  getName(): string {
    return this.name;
  }

  getSurname(): string {
    return this.surname;
  }

  getRegisteredAt(): Date {
    return this.registeredAt;
  }

  getBooks(): Book[] {
    return this.books;
  }
}
