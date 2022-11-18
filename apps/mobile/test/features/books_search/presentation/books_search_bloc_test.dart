import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/core/error/failure.dart';
import 'package:mobile/di/injection.dart';
import 'package:mobile/features/books/domain/entities/author.dart';
import 'package:mobile/features/books/domain/entities/book.dart';
import 'package:mobile/features/books/domain/entities/genre.dart';
import 'package:mobile/features/books/domain/usecases/get_book_by_id_usecase.dart';
import 'package:mobile/features/books/domain/usecases/get_books_by_title_or_author_usecase.dart';
import 'package:mobile/features/books_search/presentation/bloc/books_search_bloc.dart';
import 'package:mockito/mockito.dart';

import '../../../core/di/test_env_injection.dart';
import '../../../core/test_env_setup.dart';

void main() {
  late BooksSearchBloc bloc;
  late GetBooksByTitleOrAuthorUsecase mockGetBooksByTitleOrAuthor;
  late GetBookByIdUsecase mockGetBookById;

  setUpAll(() async {
    await loadTestEnvVars();
    configureTestDependencyInjection();
  });

  setUp(() {
    mockGetBooksByTitleOrAuthor = getIt<GetBooksByTitleOrAuthorUsecase>();
    mockGetBookById = getIt<GetBookByIdUsecase>();
    bloc = BooksSearchBloc(
        getBookById: mockGetBookById,
        getBooksByTitleOrAuthor: mockGetBooksByTitleOrAuthor);
  });

  test('initial state should be BooksSearchEmptyState', () {
    // assert
    expect(bloc.state, equals(BooksSearchEmptyState()));
  });

  group('GetBooksByTitlteOrAuthor', () {
    List<Book> tBooks = [
      Book(
        id: '1',
        title: 'Test',
        description: 'Test',
        publishedAt: DateTime(2022, 11, 4),
        author: Author(id: '1', name: 'Test', surname: 'Test'),
        genre: Genre(id: '1', name: 'Test'),
      ),
      Book(
        id: '2',
        title: 'Test',
        description: 'Test',
        publishedAt: DateTime(2022, 11, 4),
        author: Author(id: '1', name: 'Test', surname: 'Test'),
        genre: Genre(id: '1', name: 'Test'),
      ),
    ];

    void setUpUsecaseSuccess() {
      when(mockGetBooksByTitleOrAuthor(const GetBooksByTitleOrAuthorParams()))
          .thenAnswer((_) async => Right(tBooks));
      when(mockGetBooksByTitleOrAuthor(
              const GetBooksByTitleOrAuthorParams(titleOrAuthor: 'test')))
          .thenAnswer((_) async => Right(tBooks));
    }

    void setUpUsecaseFailure() =>
        when(mockGetBooksByTitleOrAuthor(const GetBooksByTitleOrAuthorParams()))
            .thenAnswer((_) async => Left(ServerFailure()));

    test(
      'should get data from usecase if title or author not provided',
      (() async {
        // arrange
        setUpUsecaseSuccess();
        // act
        bloc.add(const GetBooksEvent());
        await untilCalled(
            mockGetBooksByTitleOrAuthor(const GetBooksByTitleOrAuthorParams()));
        // assert
        verify(
            mockGetBooksByTitleOrAuthor(const GetBooksByTitleOrAuthorParams()));
      }),
    );

    test(
      'should get data from usecase if title or author is provided',
      (() async {
        // arrange
        setUpUsecaseSuccess();
        // act
        bloc.add(const GetBooksEvent("test"));
        await untilCalled(mockGetBooksByTitleOrAuthor(
            const GetBooksByTitleOrAuthorParams(titleOrAuthor: 'test')));
        // assert
        verify(mockGetBooksByTitleOrAuthor(
            const GetBooksByTitleOrAuthorParams(titleOrAuthor: 'test')));
      }),
    );

    test(
        'should emit [BooksSearchLoadingState, BooksSearchLoadedState] on usecase success',
        (() async {
      // arrange
      setUpUsecaseSuccess();
      // assert later
      final expected = [
        BooksSearchLoadingState(),
        BooksSearchLoadedState(books: tBooks)
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      // act
      bloc.add(const GetBooksEvent());
    }));

    test(
        'should emit [BooksSearchLoadingState, BooksSearchErrorState] on usecase failure',
        (() async {
      // arrange
      setUpUsecaseFailure();
      // assert later
      final expected = [
        BooksSearchLoadingState(),
        const BooksSearchErrorState(message: 'An error occured')
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      // act
      bloc.add(const GetBooksEvent());
    }));
  });

  group('GetBookById', () {
    final tBook = Book(
      id: '1',
      title: 'Test',
      description: 'Test',
      publishedAt: DateTime(2022, 11, 4),
      author: Author(id: '1', name: 'Test', surname: 'Test'),
      genre: Genre(id: '1', name: 'Test'),
    );
    const tBookId = '1';

    void setUpUsecaseSuccess() =>
        when(mockGetBookById(const GetBookByIdParams(id: tBookId)))
            .thenAnswer((_) async => Right(tBook));

    void setUpUsecaseFailure() =>
        when(mockGetBookById(const GetBookByIdParams(id: tBookId)))
            .thenAnswer((_) async => Left(ServerFailure()));

    test(
      'should get data from usecase',
      (() async {
        // arrange
        setUpUsecaseSuccess();
        // act
        bloc.add(const GetBookByIdEvent(bookId: '1'));
        await untilCalled(
            mockGetBookById(const GetBookByIdParams(id: tBookId)));
        // assert
        verify(mockGetBookById(const GetBookByIdParams(id: tBookId)));
      }),
    );

    test(
        'should emit [BooksSearchLoadingState, BooksSearchLoadedState] on usecase success',
        (() async {
      // arrange
      setUpUsecaseSuccess();
      // assert later
      final expected = [
        BooksSearchLoadingState(),
        BooksSearchLoadedState(books: [tBook])
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      // act
      bloc.add(const GetBookByIdEvent(bookId: '1'));
    }));

    test(
        'should emit [BooksSearchLoadingState, BooksSearchErrorState] on usecase failure',
        (() async {
      // arrange
      setUpUsecaseFailure();
      // assert later
      final expected = [
        BooksSearchLoadingState(),
        const BooksSearchErrorState(message: 'An error occured')
      ];
      expectLater(bloc.stream, emitsInOrder(expected));
      // act
      bloc.add(const GetBookByIdEvent(bookId: '1'));
    }));
  });
}
