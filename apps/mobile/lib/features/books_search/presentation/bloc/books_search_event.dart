part of 'books_search_bloc.dart';

abstract class BooksSearchEvent extends Equatable {
  const BooksSearchEvent();

  @override
  List<Object?> get props => [];
}

class GetBooksEvent extends BooksSearchEvent {
  final String? titleOrAuthor;

  const GetBooksEvent([this.titleOrAuthor]);

  @override
  List<Object?> get props => [titleOrAuthor];
}

class GetBookByIdEvent extends BooksSearchEvent {
  final String bookId;

  const GetBookByIdEvent({required this.bookId});

  @override
  List<Object?> get props => [bookId];
}
