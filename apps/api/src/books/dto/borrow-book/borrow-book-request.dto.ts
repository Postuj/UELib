import { Type } from 'class-transformer';
import { IsDate } from 'class-validator';

export class BorrowBookRequestDto {
  @Type(() => Date)
  @IsDate()
  readonly plannedDateOfReturn: Date;
}
