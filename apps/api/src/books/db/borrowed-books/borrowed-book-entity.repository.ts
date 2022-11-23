import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { BorrowedBook } from 'src/books/entities/borrowed-book/borrowed-book.entity';
import { BaseEntityRepository } from 'src/database/base-entity.repository';
import { IsNull, Not, Repository } from 'typeorm';
import { BorrowedBookSchemaFactory } from './borrowed-book-schema.factory';
import { BorrowedBookSchema } from './borrowed-book.schema';

@Injectable()
export class BorrowedBookEntityRepository extends BaseEntityRepository<
  BorrowedBookSchema,
  BorrowedBook
> {
  constructor(
    @InjectRepository(BorrowedBookSchema)
    borrowedBooksRepo: Repository<BorrowedBookSchema>,
    borrowedBookSchemaFactory: BorrowedBookSchemaFactory,
  ) {
    super(borrowedBooksRepo, borrowedBookSchemaFactory);
  }

  async findActiveBookBorrowings(bookId: string): Promise<BorrowedBook[]> {
    const borrowedBooks = await this.entityRepo.findBy({ bookId, returnedAt: IsNull() });

    return await borrowedBooks.map((borrowedBook) =>
      this.entitySchemaFactory.createFromSchema(borrowedBook),
    );
  }

  async findUserActiveBookBorrowings(userId: string): Promise<BorrowedBook[]> {
    const borrowedBooks = await this.entityRepo.findBy({
      borrowedById: userId,
      returnedAt: IsNull(),
    });

    return await borrowedBooks.map((borrowedBook) =>
      this.entitySchemaFactory.createFromSchema(borrowedBook),
    );
  }

  async findUserPastBookBorrowings(userId: string): Promise<BorrowedBook[]> {
    const borrowedBooks = await this.entityRepo.findBy({
      borrowedById: userId,
      returnedAt: Not(IsNull()),
    });

    return await borrowedBooks.map((borrowedBook) =>
      this.entitySchemaFactory.createFromSchema(borrowedBook),
    );
  }

  async create(borrowedBook: BorrowedBook): Promise<BorrowedBook> {
    const borrowedBookSchema = await this.entityRepo.save(
      this.entityRepo.create({
        bookId: borrowedBook.getBook().getId(),
        borrowedById: borrowedBook.getBorrowedBy().getId(),
        plannedDateOfRuturn: borrowedBook.getPlannedDateOfReturn(),
      }),
    );
    const updatedBorrowedBookSchema = await this.entityRepo.findOneBy({
      id: borrowedBookSchema.id,
    });

    return this.entitySchemaFactory.createFromSchema(updatedBorrowedBookSchema);
  }
}
