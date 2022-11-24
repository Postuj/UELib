import 'package:injectable/injectable.dart';
import 'package:mobile/di/injection.dart';
import 'package:mobile/features/books/domain/repositories/books_repository.dart';
import 'package:mobile/features/books/domain/usecases/get_book_by_id_usecase.dart';
import 'package:mobile/features/books/domain/usecases/get_book_with_availability_usecase.dart';
import 'package:mobile/features/books/domain/usecases/get_books_by_title_or_author_usecase.dart';
import 'package:mobile/features/books/domain/usecases/get_borrowing_history_usecase.dart';
import 'package:mobile/features/books/domain/usecases/get_currently_borrowed_books_usecase.dart';
import 'package:mobile/features/books/presentation/blocs/currently_borrowed/currently_borrowed_bloc.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([
  MockSpec<CurrentlyBorrowedBloc>(),
  MockSpec<BooksRepository>(),
  MockSpec<GetBooksByTitleOrAuthorUsecase>(),
  MockSpec<GetBookByIdUsecase>(),
  MockSpec<GetBookWithAvailabilityUsecase>(),
  MockSpec<GetCurrentlyBorrowedBooksUsecase>(),
  MockSpec<GetBorrowingHistoryUsecase>(),
])
import 'books_test_module.mocks.dart';

@module
abstract class BooksTestModule {
  @testEnv
  CurrentlyBorrowedBloc get currentlyBorrowedBloc =>
      MockCurrentlyBorrowedBloc();
  @testEnv
  BooksRepository get booksRepository => MockBooksRepository();
  @testEnv
  GetBooksByTitleOrAuthorUsecase get getBooksByTitleOrAuthorUsecase =>
      MockGetBooksByTitleOrAuthorUsecase();
  @testEnv
  GetBookByIdUsecase get getBookByIdUsecase => MockGetBookByIdUsecase();
  @testEnv
  GetBookWithAvailabilityUsecase get getBookWithAvailabilityUsecase =>
      MockGetBookWithAvailabilityUsecase();
  @testEnv
  GetCurrentlyBorrowedBooksUsecase get getCurrentlyBorrowedBooksUsecase =>
      MockGetCurrentlyBorrowedBooksUsecase();
  @testEnv
  GetBorrowingHistoryUsecase get getBorrowingHistoryUsecase =>
      MockGetBorrowingHistoryUsecase();
}
