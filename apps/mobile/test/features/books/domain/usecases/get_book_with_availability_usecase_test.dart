import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/di/injection.dart';
import 'package:mobile/features/books/domain/entities/author.dart';
import 'package:mobile/features/books/domain/entities/book_with_availability.dart';
import 'package:mobile/features/books/domain/entities/genre.dart';
import 'package:mobile/features/books/domain/repositories/books_repository.dart';
import 'package:mobile/features/books/domain/usecases/get_book_with_availability_usecase.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/di/test_env_injection.dart';
import '../../../../core/test_env_setup.dart';

void main() {
  late GetBookWithAvailabilityUsecase usecase;
  late BooksRepository mockBooksRepository;

  setUpAll(() async {
    await loadTestEnvVars();
    configureTestDependencyInjection();
  });

  setUp(() {
    mockBooksRepository = getIt<BooksRepository>();
    usecase = GetBookWithAvailabilityUsecase(repository: mockBooksRepository);
  });

  const tBookId = '123';
  final tBookWithAvailability = BookWithAvailability(
    id: tBookId,
    title: 'Test',
    description: null,
    publishedAt: DateTime(2022, 10, 23),
    author: Author(id: '123', name: 'Test', surname: 'Author'),
    genre: Genre(id: '123', name: 'Test'),
    isAvailable: true,
    plannedDateOfReturn: null,
  );

  test(
    'should get book by id from repository',
    () async {
      // arrange
      when(mockBooksRepository.getBookWithAvailability(tBookId))
          .thenAnswer((_) async => Right(tBookWithAvailability));
      // act
      final result =
          await usecase(const GetBookWithAvailabilityParams(id: tBookId));
      // assert
      expect(result, Right(tBookWithAvailability));
      verify(mockBooksRepository.getBookWithAvailability(tBookId));
      verifyNoMoreInteractions(mockBooksRepository);
    },
  );
}
