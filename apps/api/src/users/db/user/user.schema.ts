import { BorrowedBookSchema } from 'src/books/db/borrowed-books/borrowed-book.schema';
import { BaseSchema } from 'src/database/base.schema';
import { Column, Entity, OneToMany } from 'typeorm';

@Entity('users')
export class UserSchema extends BaseSchema {
  @Column()
  email: string;

  @Column()
  passwordHash: string;

  @Column({ nullable: true })
  refreshTokenHash?: string;

  @OneToMany(() => BorrowedBookSchema, (borrowedBook) => borrowedBook.borrowedBy)
  borrowHistory: BorrowedBookSchema[];
}
