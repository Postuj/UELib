import { BaseSchema } from 'src/database/base.schema';
import { Column, CreateDateColumn, Entity, OneToMany, PrimaryGeneratedColumn } from 'typeorm';
import { BookSchema } from '../book/book.schema';

@Entity('authors')
export class AuthorSchema extends BaseSchema {

  @Column()
  name: string;

  @Column()
  surname: string;

  @OneToMany(() => BookSchema, (book) => book.author)
  books: BookSchema[];
}
