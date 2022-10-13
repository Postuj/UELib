import { Module } from '@nestjs/common';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AuthorSchema } from 'src/books/db/author/author.schema';
import { BookSchema } from 'src/books/db/book/book.schema';
import { BorrowedBookSchema } from 'src/books/db/borrowed-books/borrowed-book.schema';
import { GenreSchema } from 'src/books/db/genre/genre.schema';
import { UserSchema } from 'src/users/db/user/user.schema';

@Module({
  imports: [
    TypeOrmModule.forRootAsync({
      imports: [ConfigModule],
      inject: [ConfigService],
      useFactory: (configService: ConfigService) => ({
        type: 'postgres',
        host: configService.get<string>('DB_HOST'),
        port: configService.get<number>('DB_PORT'),
        username: configService.get<string>('DB_USER'),
        database: configService.get<string>('DB_NAME'),
        entities: [UserSchema, BookSchema, AuthorSchema, GenreSchema, BorrowedBookSchema],
        synchronize: true,
      }),
    }),
  ],
})
export class DatabaseModule {}
