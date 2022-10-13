import { BaseSchema } from 'src/database/base.schema';
import { UserSchema } from 'src/users/db/user/user.schema';
import { Column, Entity, JoinColumn, ManyToOne } from 'typeorm';
import { BookSchema } from '../book/book.schema';

@Entity('borrowed_books')
export class BorrowedBookSchema extends BaseSchema {
  @ManyToOne(() => BookSchema, (book) => book.borrowHistory, { eager: true })
  @JoinColumn({ name: 'book_id' })
  book: BookSchema;

  @Column({ name: 'book_id' })
  bookId: string;

  @ManyToOne(() => UserSchema, (user) => user.borrowHistory, { eager: true })
  @JoinColumn({ name: 'borrowed_by_id' })
  borrowedBy: UserSchema;

  @Column({ name: 'borrowed_by_id' })
  borrowedById: string;

  @Column({ type: 'timestamptz', name: 'planned_date_of_return' })
  plannedDateOfRuturn: Date;

  @Column({ type: 'timestamptz', name: 'returned_at', nullable: true })
  returnedAt?: Date;
}
