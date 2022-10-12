import { BaseSchema } from 'src/database/base.schema';
import { Column, Entity, OneToMany } from 'typeorm';
import { BookSchema } from '../book/book.schema';

@Entity('genres')
export class GenreSchema extends BaseSchema {
  @Column()
  name: string;

  @OneToMany(() => BookSchema, (book) => book.genre)
  books: BookSchema[];
}
