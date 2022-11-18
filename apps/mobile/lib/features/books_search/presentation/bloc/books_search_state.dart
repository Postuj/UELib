part of 'books_search_bloc.dart';

abstract class BooksSearchState extends Equatable {
  const BooksSearchState();

  @override
  List<Object> get props => [];
}

class BooksSearchEmptyState extends BooksSearchState {}

class BooksSearchLoadingState extends BooksSearchState {}

class BooksSearchLoadedState extends BooksSearchState {
  final List<Book> books;

  const BooksSearchLoadedState({required this.books});

  @override
  List<Object> get props => [books];
}

class BooksSearchErrorState extends BooksSearchState {
  final String message;

  const BooksSearchErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
