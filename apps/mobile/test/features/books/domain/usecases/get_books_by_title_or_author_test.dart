import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/di/injection.dart';
import 'package:mobile/features/books/domain/entities/author.dart';
import 'package:mobile/features/books/domain/entities/book.dart';
import 'package:mobile/features/books/domain/entities/genre.dart';
import 'package:mobile/features/books/domain/repositories/books_repository.dart';
import 'package:mobile/features/books/domain/usecases/get_books_by_title_or_author_usecase.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/di/test_env_injection.dart';
import '../../../../core/test_env_setup.dart';

void main() {
  late GetBooksByTitleOrAuthorUsecase usecase;
  late BooksRepository mockBooksRepository;

  setUpAll(() async {
    await loadTestEnvVars();
    configureTestDependencyInjection();
  });

  setUp(() {
    mockBooksRepository = getIt<BooksRepository>();
    usecase = GetBooksByTitleOrAuthorUsecase(repository: mockBooksRepository);
  });

  const tTitleOrAuthor = 'Test';
  final List<Book> tBooks = [
    Book(
      id: '123',
      title: 'Test',
      description: null,
      publishedAt: DateTime(2022, 10, 23),
      author: Author(id: '1', name: 'John', surname: 'Doe'),
      genre: Genre(id: '1', name: 'Test'),
    ),
    Book(
      id: '123',
      title: 'Second',
      description: null,
      publishedAt: DateTime(2022, 10, 23),
      author: Author(id: '1', name: 'John', surname: 'Doe'),
      genre: Genre(id: '1', name: 'Second'),
    ),
  ];
  final List<Book> tBooksFiltered = [tBooks[0]];

  test('should get all books', () async {
    // arrange
    when(mockBooksRepository.getBooks()).thenAnswer((_) async => Right(tBooks));
    // act
    final result = await usecase(const GetBooksByTitleOrAuthorParams());
    // assert
    expect(result, Right(tBooks));
    verify(mockBooksRepository.getBooks());
    verifyNoMoreInteractions(mockBooksRepository);
  });

  test('should get books by title or author', () async {
    // arrange
    when(mockBooksRepository.getBooks(titleOrAuthor: tTitleOrAuthor))
        .thenAnswer((_) async => Right(tBooksFiltered));
    // act
    final result = await usecase(
        const GetBooksByTitleOrAuthorParams(titleOrAuthor: tTitleOrAuthor));
    // assert
    expect(result, Right(tBooksFiltered));
    verify(mockBooksRepository.getBooks(titleOrAuthor: tTitleOrAuthor));
    verifyNoMoreInteractions(mockBooksRepository);
  });
}
