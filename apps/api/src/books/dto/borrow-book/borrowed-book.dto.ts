import { BookDto } from "../book/book.dto";

export class BorrowedBookDto extends BookDto {
    borrowedAt: Date;
    plannedDateOfReturn: Date;
    returnedAt?: Date;
}