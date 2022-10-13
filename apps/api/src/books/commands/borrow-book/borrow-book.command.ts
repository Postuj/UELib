import { User } from 'src/users/entities/user/user.entity';

export class BorrowBookCommand {
  constructor(
    public readonly user: User,
    public readonly bookId: string,
    public readonly plannedDateOfReturn: Date,
  ) {}
}
