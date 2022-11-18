import { BaseEntity } from 'src/core/base.entity';
import { User } from 'src/users/entities/user/user.entity';
import { Book } from '../book/book.entity';

export class BorrowedBook extends BaseEntity {
  constructor(
    id: string,
    private book: Book,
    private borrowedBy: User,
    private plannedDateOfReturn: Date,
    private borrowedAt: Date = new Date(),
    private updatedAt: Date = new Date(),
    private returnedAt?: Date,
  ) {
    super(id);
  }

  getBook(): Book {
    return this.book;
  }

  getBorrowedBy(): User {
    return this.borrowedBy;
  }

  getPlannedDateOfReturn(): Date {
    return this.plannedDateOfReturn;
  }

  getReturnedAt(): Date | null {
    return this.returnedAt;
  }

  getBorrowedAt(): Date {
    return this.borrowedAt;
  }

  getUpdatedAt(): Date {
    return this.updatedAt;
  }
}
