import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../books/domain/entities/book.dart';
import '../../../books/domain/usecases/get_book_by_id_usecase.dart';
import '../../../books/domain/usecases/get_books_by_title_or_author_usecase.dart';

part 'books_search_event.dart';
part 'books_search_state.dart';

@injectable
class BooksSearchBloc extends Bloc<BooksSearchEvent, BooksSearchState> {
  final GetBookByIdUsecase _getBookById;
  final GetBooksByTitleOrAuthorUsecase _getBooksByTitleOrAuthor;
  BooksSearchBloc({
    required GetBookByIdUsecase getBookById,
    required GetBooksByTitleOrAuthorUsecase getBooksByTitleOrAuthor,
  })  : _getBookById = getBookById,
        _getBooksByTitleOrAuthor = getBooksByTitleOrAuthor,
        super(BooksSearchEmptyState()) {
    on<GetBooksEvent>(_handleGetBooksEvent);
    on<GetBookByIdEvent>(_handleGetBookByIdEvent);
  }

  Future<void> _handleGetBooksEvent(
    GetBooksEvent event,
    Emitter<BooksSearchState> emit,
  ) async {
    if (state is! BooksSearchLoadedState) emit(BooksSearchLoadingState());
    final result = await _getBooksByTitleOrAuthor(
        GetBooksByTitleOrAuthorParams(titleOrAuthor: event.titleOrAuthor));
    result.fold(
      (failure) {
        emit(const BooksSearchErrorState(message: 'An error occured'));
      },
      (books) {
        emit(BooksSearchLoadedState(books: books));
      },
    );
  }

  Future<void> _handleGetBookByIdEvent(
    GetBookByIdEvent event,
    Emitter<BooksSearchState> emit,
  ) async {
    emit(BooksSearchLoadingState());
    final result = await _getBookById(GetBookByIdParams(id: event.bookId));
    result.fold(
      (failure) {
        emit(const BooksSearchErrorState(message: 'An error occured'));
      },
      (book) {
        emit(BooksSearchLoadedState(books: [book]));
      },
    );
  }
}
