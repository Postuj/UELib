part of 'borrowing_history_bloc.dart';

abstract class BorrowingHistoryState extends Equatable {
  const BorrowingHistoryState();

  @override
  List<Object> get props => [];
}

class BorrowingHistoryEmptyState extends BorrowingHistoryState {
  const BorrowingHistoryEmptyState();
}

class BorrowingHistoryLoadingState extends BorrowingHistoryState {
  const BorrowingHistoryLoadingState();
}

class BorrowingHistoryLoadedState extends BorrowingHistoryState {
  final List<BorrowedBook> books;

  const BorrowingHistoryLoadedState({required this.books});

  @override
  List<Object> get props => [books];
}

class BorrowingHistoryErrorState extends BorrowingHistoryState {
  const BorrowingHistoryErrorState();
}
