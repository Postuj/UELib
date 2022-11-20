import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/di/injection.dart';
import 'package:mobile/features/books/domain/repositories/books_repository.dart';
import 'package:mobile/features/borrow_book/usecases/borrow_book_usecase.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/di/test_env_injection.dart';
import '../../../../core/test_env_setup.dart';

void main() {
  late BorrowBookUsecase usecase;
  late BooksRepository mockBooksRepository;

  setUpAll(() async {
    await loadTestEnvVars();
    configureTestDependencyInjection();
  });

  setUp(() {
    mockBooksRepository = getIt<BooksRepository>();
    usecase = BorrowBookUsecase(booksRepository: mockBooksRepository);
  });

  const tBookId = '123';
  final tPlannedDateOfReturn = DateTime.now();

  test(
    'should borrow book by calling repository',
    () async {
      // arrange
      when(mockBooksRepository.borrowBook(
              id: tBookId, plannedDateOfReturn: tPlannedDateOfReturn))
          .thenAnswer((_) async => const Right(null));
      // act
      final result = await usecase(BorrowBookUsecaseParams(
          id: tBookId, plannedDateOfReturn: tPlannedDateOfReturn));
      // assert
      expect(result, const Right(null));
      verify(mockBooksRepository.borrowBook(
          id: tBookId, plannedDateOfReturn: tPlannedDateOfReturn));
      verifyNoMoreInteractions(mockBooksRepository);
    },
  );
}
