import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/core/domain/usecases/usecase.dart';
import 'package:mobile/core/error/failure.dart';
import 'package:mobile/di/injection.dart';
import 'package:mobile/features/books/domain/entities/author.dart';
import 'package:mobile/features/books/domain/entities/borrowed_book.dart';
import 'package:mobile/features/books/domain/entities/genre.dart';
import 'package:mobile/features/books/domain/usecases/get_currently_borrowed_books_usecase.dart';
import 'package:mobile/features/books/presentation/blocs/currently_borrowed/currently_borrowed_bloc.dart';
import 'package:mockito/mockito.dart';

import '../../../core/di/test_env_injection.dart';
import '../../../core/test_env_setup.dart';

void main() {
  late CurrentlyBorrowedBloc bloc;
  late GetCurrentlyBorrowedBooksUsecase mockGetCurrentlyBorrowedBooksUsecase;

  setUpAll(() async {
    await loadTestEnvVars();
    configureTestDependencyInjection();
  });

  setUp(() {
    mockGetCurrentlyBorrowedBooksUsecase =
        getIt<GetCurrentlyBorrowedBooksUsecase>();
    bloc = CurrentlyBorrowedBloc(
        getCurrentlyBorrowedBooksUsecase: mockGetCurrentlyBorrowedBooksUsecase);
  });

  test('initial state should be BooksSearchEmptyState', () {
    // assert
    expect(bloc.state, equals(const CurrentlyBorrowedEmptyState()));
  });

  group('GetCurrentlyBorrowedEvent', () {
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
      when(mockGetCurrentlyBorrowedBooksUsecase(const NoParams()))
          .thenAnswer((_) async => Right(tBorrowedBooks));
    }

    void setUpUsecaseFailure() =>
        when(mockGetCurrentlyBorrowedBooksUsecase(const NoParams()))
            .thenAnswer((_) async => Left(ServerFailure()));

    test(
      'should get data from usecase',
      (() async {
        // arrange
        setUpUsecaseSuccess();
        // act
        bloc.add(const GetCurrentlyBorrowedEvent());
        await untilCalled(
            mockGetCurrentlyBorrowedBooksUsecase(const NoParams()));
        // assert
        verify(mockGetCurrentlyBorrowedBooksUsecase(const NoParams()));
      }),
    );

    test(
        'should emit [CurrentlyBorrowedLoadingState, CurrentlyBorrowedLoadedState] on usecase success',
        (() async {
      // arrange
      setUpUsecaseSuccess();
      // assert later
      final expected = [
        const CurrentlyBorrowedLoadingState(),
        CurrentlyBorrowedLoadedState(books: tBorrowedBooks)
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      // act
      bloc.add(const GetCurrentlyBorrowedEvent());
    }));

    test(
        'should emit [CurrentlyBorrowedLoadingState, BooksSearchErrorState] on usecase failure',
        (() async {
      // arrange
      setUpUsecaseFailure();
      // assert later
      final expected = [
        const CurrentlyBorrowedLoadingState(),
        const CurrentlyBorrowedErrorState()
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      // act
      bloc.add(const GetCurrentlyBorrowedEvent());
    }));
  });
}
