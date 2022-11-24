import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/core/domain/usecases/usecase.dart';
import 'package:mobile/core/error/failure.dart';
import 'package:mobile/di/injection.dart';
import 'package:mobile/features/books/domain/entities/author.dart';
import 'package:mobile/features/books/domain/entities/borrowed_book.dart';
import 'package:mobile/features/books/domain/entities/genre.dart';
import 'package:mobile/features/books/domain/usecases/get_borrowing_history_usecase.dart';
import 'package:mobile/features/books/presentation/blocs/borrowing_history/borrowing_history_bloc.dart';
import 'package:mockito/mockito.dart';

import '../../../core/di/test_env_injection.dart';
import '../../../core/test_env_setup.dart';

void main() {
  late BorrowingHistoryBloc bloc;
  late GetBorrowingHistoryUsecase mockGetBorrowingHistoryUsecase;

  setUpAll(() async {
    await loadTestEnvVars();
    configureTestDependencyInjection();
  });

  setUp(() {
    mockGetBorrowingHistoryUsecase = getIt<GetBorrowingHistoryUsecase>();
    bloc = BorrowingHistoryBloc(
        getBorrowingHistoryUsecase: mockGetBorrowingHistoryUsecase);
  });

  test('initial state should be BorrowingHistoryEmptyState', () {
    // assert
    expect(bloc.state, equals(const BorrowingHistoryEmptyState()));
  });

  group('GetBorrowingHistoryEvent', () {
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

    void setUpUsecaseSuccess() {
      when(mockGetBorrowingHistoryUsecase(const NoParams()))
          .thenAnswer((_) async => Right(tBorrowedBooks));
    }

    void setUpUsecaseFailure() =>
        when(mockGetBorrowingHistoryUsecase(const NoParams()))
            .thenAnswer((_) async => Left(ServerFailure()));

    test(
      'should get data from usecase',
      (() async {
        // arrange
        setUpUsecaseSuccess();
        // act
        bloc.add(const GetBorrowingHistoryEvent());
        await untilCalled(mockGetBorrowingHistoryUsecase(const NoParams()));
        // assert
        verify(mockGetBorrowingHistoryUsecase(const NoParams()));
      }),
    );

    test(
        'should emit [BorrowingHistoryLoadingState, BorrowingHistoryLoadedState] on usecase success',
        (() async {
      // arrange
      setUpUsecaseSuccess();
      // assert later
      final expected = [
        const BorrowingHistoryLoadingState(),
        BorrowingHistoryLoadedState(books: tBorrowedBooks)
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      // act
      bloc.add(const GetBorrowingHistoryEvent());
    }));

    test(
        'should emit [BorrowingHistoryLoadingState, BooksSearchErrorState] on usecase failure',
        (() async {
      // arrange
      setUpUsecaseFailure();
      // assert later
      final expected = [
        const BorrowingHistoryLoadingState(),
        const BorrowingHistoryErrorState()
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      // act
      bloc.add(const GetBorrowingHistoryEvent());
    }));
  });
}
