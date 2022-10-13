export class BookBorrowedEvent {
  constructor(
    public readonly userId: string,
    public readonly bookId: string,
    public readonly plannedReturnDate: Date,
  ) {}
}
