import { IdentifiableEntity } from '../../../core/identifiable.entity';
import { Book } from '../../../books/entities/book/book.entity';
import { BookBorrowedEvent } from '../../../books/events/book-borrowed/book-borrowed.event';

export class User extends IdentifiableEntity {
  constructor(id: string, protected readonly email: string) {
    super(id);
  }

  getEmail(): string {
    return this.email;
  }

  borrowBook(book: Book, plannedDateOfReturn: Date): void {
    this.apply(new BookBorrowedEvent(this.id, book.getId(), plannedDateOfReturn));
  }
}
