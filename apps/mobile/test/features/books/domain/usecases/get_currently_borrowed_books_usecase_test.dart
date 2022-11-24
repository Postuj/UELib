import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/core/domain/usecases/usecase.dart';
import 'package:mobile/di/injection.dart';
import 'package:mobile/features/books/domain/entities/author.dart';
import 'package:mobile/features/books/domain/entities/borrowed_book.dart';
import 'package:mobile/features/books/domain/entities/genre.dart';
import 'package:mobile/features/books/domain/repositories/books_repository.dart';
import 'package:mobile/features/books/domain/usecases/get_currently_borrowed_books_usecase.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/di/test_env_injection.dart';
import '../../../../core/test_env_setup.dart';

void main() {
  late GetCurrentlyBorrowedBooksUsecase usecase;
  late BooksRepository mockBooksRepository;

  setUpAll(() async {
    await loadTestEnvVars();
    configureTestDependencyInjection();
  });

  setUp(() {
    mockBooksRepository = getIt<BooksRepository>();
    usecase = GetCurrentlyBorrowedBooksUsecase(repository: mockBooksRepository);
  });

  final List<BorrowedBook> tBorrowedBooks = [
    BorrowedBook(
      id: '123',
      title: 'Test',
      description: null,
      publishedAt: DateTime(2022, 10, 23),
      author: Author(id: '123', name: 'Test', surname: 'Author'),
      genre: Genre(id: '123', name: 'Test'),
      borrowedAt: DateTime(2022, 11, 21),
      returnedAt: DateTime(2022, 11, 24),
      plannedDateOfReturn: DateTime(2022, 12, 5),
    )
  ];

  test('should get currently borrowed books', () async {
    // arrange
    when(mockBooksRepository.getCurrentlyBorrowedBooks())
        .thenAnswer((_) async => Right(tBorrowedBooks));
    // act
    final result = await usecase(const NoParams());
    // assert
    expect(result, Right(tBorrowedBooks));
    verify(mockBooksRepository.getCurrentlyBorrowedBooks());
    verifyNoMoreInteractions(mockBooksRepository);
  });
}
