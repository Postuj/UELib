import { Column, CreateDateColumn, Entity, OneToMany, PrimaryGeneratedColumn } from 'typeorm';
import { BookSchema } from '../book/book.schema';

@Entity('authors')
export class AuthorSchema {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @Column()
  name: string;

  @Column()
  surname: string;

  @OneToMany(() => BookSchema, (book) => book.author)
  books: BookSchema[];

  @CreateDateColumn({name: 'registered_at'})
  registeredAt: Date;
}
