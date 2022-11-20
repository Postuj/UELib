part of 'borrow_book_bloc.dart';

abstract class BorrowBookEvent extends Equatable {
  const BorrowBookEvent();

  @override
  List<Object> get props => [];
}

class BorrowBookScannedEvent extends BorrowBookEvent {
  final String bookId;

  const BorrowBookScannedEvent({required this.bookId});

  @override
  List<Object> get props => [bookId];
}

class BorrowBookBorrowEvent extends BorrowBookEvent {
  final String bookId;
  final DateTime plannedDateOfReturn;

  const BorrowBookBorrowEvent(
      {required this.bookId, required this.plannedDateOfReturn});

  @override
  List<Object> get props => [bookId, plannedDateOfReturn];
}
