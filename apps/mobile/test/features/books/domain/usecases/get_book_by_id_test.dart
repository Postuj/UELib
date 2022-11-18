import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/di/injection.dart';
import 'package:mobile/features/books/domain/entities/author.dart';
import 'package:mobile/features/books/domain/entities/book.dart';
import 'package:mobile/features/books/domain/entities/genre.dart';
import 'package:mobile/features/books/domain/repositories/books_repository.dart';
import 'package:mobile/features/books/domain/usecases/get_book_by_id_usecase.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/di/test_env_injection.dart';
import '../../../../core/test_env_setup.dart';

void main() {
  late GetBookByIdUsecase usecase;
  late BooksRepository mockBooksRepository;

  setUpAll(() async {
    await loadTestEnvVars();
    configureTestDependencyInjection();
  });

  setUp(() {
    mockBooksRepository = getIt<BooksRepository>();
    usecase = GetBookByIdUsecase(repository: mockBooksRepository);
  });

  const tBookId = '123';
  final tBook = Book(
    id: '123',
    title: 'Test',
    description: null,
    publishedAt: DateTime(2022, 10, 23),
    author: Author(id: '1', name: 'John', surname: 'Doe'),
    genre: Genre(id: '1', name: 'Test'),
  );

  test(
    'should get book by id from repository',
    () async {
      // arrange
      when(mockBooksRepository.getBookById(tBookId))
          .thenAnswer((_) async => Right(tBook));
      // act
      final result = await usecase(const GetBookByIdParams(id: tBookId));
      // assert
      expect(result, Right(tBook));
      verify(mockBooksRepository.getBookById(tBookId));
      verifyNoMoreInteractions(mockBooksRepository);
    },
  );
}
