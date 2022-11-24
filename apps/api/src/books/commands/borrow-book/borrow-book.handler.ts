import { ForbiddenException, NotFoundException, BadRequestException, Logger } from '@nestjs/common';
import { CommandHandler, EventPublisher, ICommandHandler } from '@nestjs/cqrs';
import { BookEntityRepository } from 'src/books/db/book/book-entity.repository';
import { BorrowedBookEntityRepository } from 'src/books/db/borrowed-books/borrowed-book-entity.repository';
import { Book } from 'src/books/entities/book/book.entity';
import { BorrowedBookFactory } from 'src/books/entities/borrowed-book/borrowed-book.factory';
import { BorrowBookCommand } from './borrow-book.command';

@CommandHandler(BorrowBookCommand)
export class BorrowBookHandler implements ICommandHandler<BorrowBookCommand> {
  private readonly logger = new Logger(BorrowBookHandler.name);

  constructor(
    private publisher: EventPublisher,
    private readonly borrowedBookRepo: BorrowedBookEntityRepository,
    private readonly booksRepo: BookEntityRepository,
    private readonly borrowedBookFactory: BorrowedBookFactory,
  ) {}

  async execute(command: BorrowBookCommand): Promise<void> {
    const { bookId, plannedDateOfReturn } = command;
    const user = this.publisher.mergeObjectContext(command.user);

    this.checkDate(plannedDateOfReturn);

    const book = await this.getBook(bookId);
    await this.checkIfBookIsAvailable(bookId);
    
    await this.borrowedBookFactory.create(book, user, plannedDateOfReturn);

    this.logger.log(`User@${user.getEmail()} borrowed a book ${book.getTitle()}`);
  }

  private checkDate(date: Date): void {
    if (date.getTime() <= Date.now()) throw new BadRequestException('Invalid date');
  }

  private async checkIfBookIsAvailable(bookId: string): Promise<void> {
    const books = await this.borrowedBookRepo.findActiveBookBorrowings(bookId);
    if (books.length !== 0) throw new ForbiddenException('Book is not available');
  }

  private async getBook(bookId: string): Promise<Book> {
    const book = await this.booksRepo.findOneById(bookId);
    if (!book) throw new NotFoundException('Book not found');
    return book;
  }
}
