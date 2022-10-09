import { Column, CreateDateColumn, Entity, OneToMany, PrimaryGeneratedColumn } from 'typeorm';
import { BookSchema } from '../book/book.schema';

@Entity('genres')
export class GenreSchema {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @Column()
  name: string;

  @CreateDateColumn({ name: 'registered_at' })
  registeredAt: Date;

  @OneToMany(() => BookSchema, (book) => book.genre)
  books: BookSchema[];
}
