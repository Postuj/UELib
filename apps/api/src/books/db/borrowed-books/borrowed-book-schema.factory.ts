import { Injectable } from '@nestjs/common';
import { BorrowedBook } from 'src/books/entities/borrowed-book/borrowed-book.entity';
import { UserSchemaFactory } from 'src/users/db/user/user-schema.factory';
import { EntitySchemaFactory } from '../../../database/entity-schema.factory';
import { BookSchemaFactory } from '../book/book-schema.factory';
import { BorrowedBookSchema } from './borrowed-book.schema';

@Injectable()
export class BorrowedBookSchemaFactory
  implements EntitySchemaFactory<BorrowedBookSchema, BorrowedBook>
{
  constructor(
    private readonly bookSchemaFactory: BookSchemaFactory,
    private readonly userSchemaFactory: UserSchemaFactory,
  ) {}

  create(entity: BorrowedBook): BorrowedBookSchema {
    return {
      id: entity.getId(),
      borrowedById: entity.getBorrowedBy().getId(),
      bookId: entity.getBook().getId(),
      plannedDateOfRuturn: entity.getPlannedDateOfReturn(),
    } as BorrowedBookSchema;
  }
  createFromSchema(entitySchema: BorrowedBookSchema): BorrowedBook {
    const book = this.bookSchemaFactory.createFromSchema(entitySchema.book);
    const user = this.userSchemaFactory.createFromSchema(entitySchema.borrowedBy);

    return new BorrowedBook(
      entitySchema.id,
      book,
      user,
      entitySchema.plannedDateOfRuturn,
      entitySchema.createdAt,
      entitySchema.updatedAt,
      entitySchema.returnedAt,
    );
  }
}
