import {
  Column,
  CreateDateColumn,
  Entity,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { AuthorSchema } from '../author/author.schema';
import { GenreSchema } from '../genre/genre.schema';

@Entity('books')
export class BookSchema {
  @PrimaryGeneratedColumn('uuid')
  id: string;

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

  @Column({ type: 'date', name: 'published_at' })
  publishedAt: Date;

  @CreateDateColumn({ name: 'registered_at' })
  registeredAt: Date;
}
