import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/core/error/failure.dart';
import 'package:mobile/di/injection.dart';
import 'package:mobile/features/books/domain/entities/author.dart';
import 'package:mobile/features/books/domain/entities/book_with_availability.dart';
import 'package:mobile/features/books/domain/entities/genre.dart';
import 'package:mobile/features/books/domain/usecases/get_book_with_availability_usecase.dart';
import 'package:mobile/features/books/presentation/blocs/currently_borrowed/currently_borrowed_bloc.dart';
import 'package:mobile/features/borrow_book/presentation/bloc/borrow_book_bloc.dart';
import 'package:mobile/features/borrow_book/usecases/borrow_book_usecase.dart';
import 'package:mockito/mockito.dart';

import '../../../core/di/test_env_injection.dart';
import '../../../core/test_env_setup.dart';

void main() {
  late BorrowBookBloc bloc;
  late CurrentlyBorrowedBloc currentlyBorrowedBloc;
  late BorrowBookUsecase borrowBookUsecase;
  late GetBookWithAvailabilityUsecase getBookWithAvailabilityUsecase;
  const tBookId = '123';
  final tBookWithAvailability = BookWithAvailability(
    isAvailable: true,
    plannedDateOfReturn: DateTime.now(),
    id: tBookId,
    title: 'Test',
    description: null,
    publishedAt: DateTime.now(),
    author: Author(id: '123', name: 'Test', surname: 'Test'),
    genre: Genre(id: '123', name: 'Test'),
  );

  setUpAll(() async {
    await loadTestEnvVars();
    configureTestDependencyInjection();
  });

  setUp(() {
    borrowBookUsecase = getIt<BorrowBookUsecase>();
    getBookWithAvailabilityUsecase = getIt<GetBookWithAvailabilityUsecase>();
    currentlyBorrowedBloc = getIt<CurrentlyBorrowedBloc>();
    bloc = BorrowBookBloc(
      borrowBookUsecase: borrowBookUsecase,
      getBookWithAvailabilityUsecase: getBookWithAvailabilityUsecase,
      currentlyBorrowedBloc: currentlyBorrowedBloc,
    );
  });

  test('Initial state should be BorrowBookScanningState', () {
    // assert
    expect(bloc.state, equals(BorrowBookScanningState()));
  });

  group('Scanned book', () {
    test(
        'should emit [BorrowBookLoadingState, BorrowBookLoadedState] on usecase success',
        () {
      // arrange
      when(getBookWithAvailabilityUsecase(
              const GetBookWithAvailabilityParams(id: tBookId)))
          .thenAnswer((_) async => Right(tBookWithAvailability));
      // assert later
      final expected = [
        BorrowBookLoadingState(),
        BorrowBookLoadedState(book: tBookWithAvailability)
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      // act
      bloc.add(const BorrowBookScannedEvent(bookId: tBookId));
    });

    test(
        'should emit [BorrowBookLoadingState, BorrowBookErrorState] on usecase failure',
        () {
      // arrange
      when(getBookWithAvailabilityUsecase(
              const GetBookWithAvailabilityParams(id: tBookId)))
          .thenAnswer((_) async => Left(ServerResourceNotFoundFailure()));
      // assert later
      final expected = [BorrowBookLoadingState(), BorrowBookErrorState()];
      expectLater(bloc.stream, emitsInOrder(expected));
      // act
      bloc.add(const BorrowBookScannedEvent(bookId: tBookId));
    });
  });

  group('Borrow book', () {
    final tPlannedDateOfReturn = DateTime.now();

    test(
        'should emit [BorrowBookLoadingState, BorrowBookBorrowedState] on usecase success',
        () {
      // arrange
      when(getBookWithAvailabilityUsecase(
              const GetBookWithAvailabilityParams(id: tBookId)))
          .thenAnswer((_) async => Right(tBookWithAvailability));
      when(borrowBookUsecase(BorrowBookUsecaseParams(
              id: tBookId, plannedDateOfReturn: tPlannedDateOfReturn)))
          .thenAnswer((_) async => const Right(null));
      // assert later
      final expected = [
        BorrowBookLoadingState(),
        BorrowBookLoadedState(book: tBookWithAvailability),
        BorrowBookBorrowingLoadingState(book: tBookWithAvailability),
        BorrowBookBorrowedState(book: tBookWithAvailability),
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      // act
      bloc.add(const BorrowBookScannedEvent(bookId: tBookId));
      bloc.add(BorrowBookBorrowEvent(
          bookId: tBookId, plannedDateOfReturn: tPlannedDateOfReturn));
    });

    test(
        'should emit [BorrowBookLoadingState, BorrowBookErrorState] on usecase failure',
        () {
      // arrange
      when(getBookWithAvailabilityUsecase(
              const GetBookWithAvailabilityParams(id: tBookId)))
          .thenAnswer((_) async => Right(tBookWithAvailability));
      when(borrowBookUsecase(BorrowBookUsecaseParams(
              id: tBookId, plannedDateOfReturn: tPlannedDateOfReturn)))
          .thenAnswer((_) async => Left(ServerResourceNotFoundFailure()));
      // assert later
      final expected = [
        BorrowBookLoadingState(),
        BorrowBookLoadedState(book: tBookWithAvailability),
        BorrowBookBorrowingLoadingState(book: tBookWithAvailability),
        BorrowBookBorrowingErrorState(book: tBookWithAvailability)
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      // act
      bloc.add(const BorrowBookScannedEvent(bookId: tBookId));
      bloc.add(BorrowBookBorrowEvent(
          bookId: tBookId, plannedDateOfReturn: tPlannedDateOfReturn));
    });
  });
}
