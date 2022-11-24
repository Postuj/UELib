part of 'currently_borrowed_bloc.dart';

abstract class CurrentlyBorrowedState extends Equatable {
  const CurrentlyBorrowedState();

  @override
  List<Object> get props => [];
}

class CurrentlyBorrowedEmptyState extends CurrentlyBorrowedState {
  const CurrentlyBorrowedEmptyState();
}

class CurrentlyBorrowedLoadingState extends CurrentlyBorrowedState {
  const CurrentlyBorrowedLoadingState();
}

class CurrentlyBorrowedLoadedState extends CurrentlyBorrowedState {
  final List<BorrowedBook> books;

  const CurrentlyBorrowedLoadedState({required this.books});

  @override
  List<Object> get props => [books];
}

class CurrentlyBorrowedErrorState extends CurrentlyBorrowedState {
  const CurrentlyBorrowedErrorState();
}
