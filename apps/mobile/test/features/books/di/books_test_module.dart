import 'package:injectable/injectable.dart';
import 'package:mobile/di/injection.dart';
import 'package:mobile/features/books/domain/repositories/books_repository.dart';
import 'package:mobile/features/books/domain/usecases/get_book_by_id_usecase.dart';
import 'package:mobile/features/books/domain/usecases/get_books_by_title_or_author_usecase.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([
  MockSpec<BooksRepository>(),
  MockSpec<GetBooksByTitleOrAuthorUsecase>(),
  MockSpec<GetBookByIdUsecase>(),
])
import 'books_test_module.mocks.dart';

@module
abstract class BooksTestModule {
  @testEnv
  BooksRepository get booksRepository => MockBooksRepository();
  @testEnv
  GetBooksByTitleOrAuthorUsecase get getBooksByTitleOrAuthorUsecase =>
      MockGetBooksByTitleOrAuthorUsecase();
  @testEnv
  GetBookByIdUsecase get getBookByIdUsecase => MockGetBookByIdUsecase();
}
