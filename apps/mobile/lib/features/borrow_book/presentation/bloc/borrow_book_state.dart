part of 'borrow_book_bloc.dart';

abstract class BorrowBookState extends Equatable {
  const BorrowBookState();

  @override
  List<Object> get props => [];
}

class BorrowBookScanningState extends BorrowBookState {}

class BorrowBookLoadingState extends BorrowBookState {}

class BorrowBookErrorState extends BorrowBookState {}

class BorrowBookLoadedState extends BorrowBookState {
  final BookWithAvailability book;

  const BorrowBookLoadedState({required this.book});

  @override
  List<Object> get props => [book];
}

class BorrowBookBorrowedState extends BorrowBookLoadedState {
  const BorrowBookBorrowedState({required super.book});
}

class BorrowBookBorrowingLoadingState extends BorrowBookLoadedState {
  const BorrowBookBorrowingLoadingState({required super.book});
}

class BorrowBookBorrowingErrorState extends BorrowBookLoadedState {
  const BorrowBookBorrowingErrorState({required super.book});
}
