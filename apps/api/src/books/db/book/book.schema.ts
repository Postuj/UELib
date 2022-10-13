import { BaseSchema } from 'src/database/base.schema';
import {
  Column,
  Entity,
  JoinColumn,
  ManyToOne,
  OneToMany,
} from 'typeorm';
import { AuthorSchema } from '../author/author.schema';
import { BorrowedBookSchema } from '../borrowed-books/borrowed-book.schema';
import { GenreSchema } from '../genre/genre.schema';

@Entity('books')
export class BookSchema extends BaseSchema {
  @Column()
  title: string;

  @Column({ type: 'text', nullable: true })
  description?: string;

  @ManyToOne(() => AuthorSchema, (author) => author.books, { eager: true })
  @JoinColumn({ name: 'author_id' })
  author: AuthorSchema;

  @Column({ name: 'author_id' })
  authorId: string;

  @ManyToOne(() => GenreSchema, (genre) => genre.books, { eager: true })
  @JoinColumn({ name: 'genre_id' })
  genre: GenreSchema;

  @Column({ name: 'genre_id' })
  genreId: string;

  @Column({ type: 'timestamptz', name: 'published_at' })
  publishedAt: Date;
  
  @OneToMany(() => BorrowedBookSchema, (borrowedBook) => borrowedBook.borrowedBy)
  borrowHistory: BorrowedBookSchema[];
}
