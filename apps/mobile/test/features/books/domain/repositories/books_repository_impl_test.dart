import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/core/data/sources/dio/interceptors/response_error_interceptor.dart';
import 'package:mobile/core/error/failure.dart';
import 'package:mobile/di/injection.dart';
import 'package:mobile/features/books/data/factories/book_entity_factory.dart';
import 'package:mobile/features/books/data/factories/book_with_availability_entity_factory.dart';
import 'package:mobile/features/books/data/factories/borrowed_book_entity_factory.dart';
import 'package:mobile/features/books/data/repositories/books_repository_impl.dart';
import 'package:mobile/features/books/data/sources/books_api.dart';
import 'package:mobile/features/books/domain/entities/author.dart';
import 'package:mobile/features/books/domain/entities/book.dart';
import 'package:mobile/features/books/domain/entities/book_with_availability.dart';
import 'package:mobile/features/books/domain/entities/borrowed_book.dart';
import 'package:mobile/features/books/domain/entities/genre.dart';

import '../../../../core/data/sources/interceptors/mock_api_failure_interceptor.dart';
import '../../../../core/data/sources/interceptors/mock_success_api_response_interceptor.dart';
import '../../../../core/di/test_env_injection.dart';
import '../../../../core/matchers/either.dart';
import '../../../../core/test_env_setup.dart';

void main() {
  late BooksRepositoryImpl repository;
  late BooksApi api;
  late Dio dio;

  setUpAll(() async {
    await loadTestEnvVars();
    configureTestDependencyInjection();
  });

  setUp(() {
    dio = getIt<Dio>();
    dio.interceptors.addAll([ResponseErrorInterceptor()]);
    api = BooksApi(dio);
    repository = BooksRepositoryImpl(
      booksApi: api,
      bookEntityFactory: getIt<BookEntityFactory>(),
      borrowedBookEntityFactory: getIt<BorrowedBookEntityFactory>(),
      bookEntityWithAvailabilityFactory:
          getIt<BookWithAvailabilityEntityFactory>(),
    );
  });

  final tBook = Book(
    id: '123',
    title: 'Test',
    description: null,
    publishedAt: DateTime(2022, 10, 23),
    author: Author(id: '123', name: 'Test', surname: 'Author'),
    genre: Genre(id: '123', name: 'Test'),
  );
  final tBooks = [
    tBook,
  ];
  final tBorrowedBook = BorrowedBook(
    id: '123',
    title: 'Test',
    description: null,
    publishedAt: DateTime(2022, 10, 23),
    author: Author(id: '123', name: 'Test', surname: 'Author'),
    genre: Genre(id: '123', name: 'Test'),
    borrowedAt: DateTime(2022, 11, 21),
    returnedAt: DateTime(2022, 11, 24),
    plannedDateOfReturn: DateTime(2022, 12, 5),
  );
  final tBorrowedBooks = [tBorrowedBook];

  void setUpApiErrorResponse(int statusCode) {
    dio.interceptors.add(MockApiFailureInterceptor(statusCode: statusCode));
  }

  group('getBookById', () {
    const tBookId = '123';
    test('should return Book from API', () async {
      // arrange
      dio.interceptors
          .add(MockSuccessApiResponseInterceptor(jsonFile: 'book.json'));
      // act
      final result = await repository.getBookById(tBookId);
      // assert
      expect(result, Right(tBook));
    });

    test('should return ServerResourceNotFoundFailure on NotFoundError',
        () async {
      // arrange
      setUpApiErrorResponse(404);
      // act
      final result = await repository.getBookById(tBookId);
      // assert
      expect(result, Left(ServerResourceNotFoundFailure()));
    });
  });

  group('getBooks', () {
    const tTitleOrAuthor = 'Test';
    test('should return Books from API when title or author not provided',
        () async {
      // arrange
      dio.interceptors
          .add(MockSuccessApiResponseInterceptor(jsonFile: 'books.json'));
      // act
      final result = await repository.getBooks();
      // assert
      expect(result, isRightThat(equals(tBooks)));
    });

    test('should return Books from API when title or author is provided',
        () async {
      // arrange
      dio.interceptors
          .add(MockSuccessApiResponseInterceptor(jsonFile: 'books.json'));
      // act
      final result = await repository.getBooks(titleOrAuthor: tTitleOrAuthor);
      // assert
      expect(result, isRightThat(equals(tBooks)));
    });
  });

  group('getCurrentlyBorrowedBooks', () {
    test('should return currently BorrowedBooks from API', () async {
      // arrange
      dio.interceptors.add(
          MockSuccessApiResponseInterceptor(jsonFile: 'borrowed_books.json'));
      // act
      final result = await repository.getCurrentlyBorrowedBooks();
      // assert
      expect(result, isRightThat(equals(tBorrowedBooks)));
    });
  });

  group('getBorrowingHistory', () {
    test('should return BorrowedBooks history', () async {
      // arrange
      dio.interceptors.add(
          MockSuccessApiResponseInterceptor(jsonFile: 'borrowed_books.json'));
      // act
      final result = await repository.getBorrowingHistory();
      // assert
      expect(result, isRightThat(equals(tBorrowedBooks)));
    });
  });

  group('getBookWithAvailability', () {
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
    test('should return BookWithAvailability from API', () async {
      // arrange
      dio.interceptors.add(MockSuccessApiResponseInterceptor(
          jsonFile: 'book_with_availability.json'));
      // act
      final result = await repository.getBookWithAvailability(tBookId);
      // assert
      expect(result, Right(tBookWithAvailability));
    });

    test('should return ServerResourceNotFoundFailure on NotFoundError',
        () async {
      // arrange
      setUpApiErrorResponse(404);
      // act
      final result = await repository.getBookWithAvailability(tBookId);
      // assert
      expect(result, Left(ServerResourceNotFoundFailure()));
    });
  });

  group('borrowBook', () {
    const tBookId = '123';
    final tPlannedDateOfReturn = DateTime.now();
    test('shouldn not return anything from API', () async {
      // arrange
      dio.interceptors.add(MockSuccessApiResponseInterceptor());
      // act
      final result = await repository.borrowBook(
        id: tBookId,
        plannedDateOfReturn: tPlannedDateOfReturn,
      );
      // assert
      expect(result, const Right(null));
    });

    test('should return ServerResourceNotFoundFailure on NotFoundError',
        () async {
      // arrange
      setUpApiErrorResponse(404);
      // act
      final result = await repository.borrowBook(
        id: tBookId,
        plannedDateOfReturn: tPlannedDateOfReturn,
      );
      // assert
      expect(result, Left(ServerResourceNotFoundFailure()));
    });
  });
}
