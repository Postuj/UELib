import { Injectable } from '@nestjs/common';
import { BorrowedBookEntityRepository } from 'src/books/db/borrowed-books/borrowed-book-entity.repository';
import { EntityFactory } from 'src/core/entity.factory';
import { User } from 'src/users/entities/user/user.entity';
import { Book } from '../book/book.entity';
import { BorrowedBook } from './borrowed-book.entity';

@Injectable()
export class BorrowedBookFactory implements EntityFactory<BorrowedBook> {
  constructor(private readonly borrowedBookRepo: BorrowedBookEntityRepository) {}

  create(book: Book, user: User, plannedDateOfReturn: Date): Promise<BorrowedBook> {
    return this.borrowedBookRepo.create(new BorrowedBook(null, book, user, plannedDateOfReturn));
  }
}
