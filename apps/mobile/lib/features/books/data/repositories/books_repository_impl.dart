import 'package:injectable/injectable.dart';
import 'package:mobile/core/data/sources/dio/error/not_found_error.dart';
import 'package:mobile/features/books/data/factories/book_entity_factory.dart';
import 'package:mobile/features/books/data/factories/book_with_availability_entity_factory.dart';
import 'package:mobile/features/books/data/factories/borrowed_book_entity_factory.dart';
import 'package:mobile/features/books/data/sources/books_api.dart';
import 'package:mobile/features/books/data/sources/requests/borrow_book_request.dart';
import 'package:mobile/features/books/domain/entities/book.dart';
import 'package:mobile/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:mobile/features/books/domain/entities/book_with_availability.dart';
import 'package:mobile/features/books/domain/entities/borrowed_book.dart';
import 'package:mobile/features/books/domain/repositories/books_repository.dart';

@Injectable(as: BooksRepository, env: ['dev', 'prod'])
class BooksRepositoryImpl implements BooksRepository {
  final BooksApi _booksApi;
  final BookEntityFactory _bookEntityFactory;
  final BorrowedBookEntityFactory _borrowedBookEntityFactory;
  final BookWithAvailabilityEntityFactory _bookEntityWithAvailabilityFactory;

  BooksRepositoryImpl({
    required BooksApi booksApi,
    required BookEntityFactory bookEntityFactory,
    required BorrowedBookEntityFactory borrowedBookEntityFactory,
    required BookWithAvailabilityEntityFactory
        bookEntityWithAvailabilityFactory,
  })  : _booksApi = booksApi,
        _bookEntityFactory = bookEntityFactory,
        _borrowedBookEntityFactory = borrowedBookEntityFactory,
        _bookEntityWithAvailabilityFactory = bookEntityWithAvailabilityFactory;

  @override
  Future<Either<Failure, Book>> getBookById(String id) async {
    try {
      final result = await _booksApi.getBookById(id);
      return Right(_bookEntityFactory.fromDto(result));
    } on NotFoundError catch (_) {
      return Left(ServerResourceNotFoundFailure());
    } catch (_) {
      return Left(ServerUnexpectedFailure());
    }
  }

  @override
  Future<Either<Failure, List<Book>>> getBooks({String? titleOrAuthor}) async {
    try {
      final result = titleOrAuthor != null
          ? await _booksApi.getBooksByTitleOrAuthor(titleOrAuthor)
          : await _booksApi.getAllBooks();

      return Right(result
          .map((bookDto) => _bookEntityFactory.fromDto(bookDto))
          .toList());
    } catch (err) {
      return Left(ServerUnexpectedFailure());
    }
  }

  @override
  Future<Either<Failure, BookWithAvailability>> getBookWithAvailability(
      String id) async {
    try {
      final result = await _booksApi.getBookWithAvailabilityById(id);
      return Right(_bookEntityWithAvailabilityFactory.fromDto(result));
    } on NotFoundError catch (_) {
      return Left(ServerResourceNotFoundFailure());
    } catch (_) {
      return Left(ServerUnexpectedFailure());
    }
  }

  @override
  Future<Either<Failure, void>> borrowBook({
    required String id,
    required DateTime plannedDateOfReturn,
  }) async {
    try {
      await _booksApi.borrowBook(
          id, BorrowBookRequest(plannedDateOfReturn: plannedDateOfReturn));
      return const Right(null);
    } on NotFoundError catch (_) {
      return Left(ServerResourceNotFoundFailure());
    } catch (_) {
      return Left(ServerUnexpectedFailure());
    }
  }

  @override
  Future<Either<Failure, List<BorrowedBook>>>
      getCurrentlyBorrowedBooks() async {
    try {
      final result = await _booksApi.getCurrentlyBorrowedBooks();
      return Right(result
          .map((dto) => _borrowedBookEntityFactory.fromDto(dto))
          .toList());
    } catch (err) {
      return Left(ServerUnexpectedFailure());
    }
  }

  @override
  Future<Either<Failure, List<BorrowedBook>>> getBorrowingHistory() async {
    try {
      final result = await _booksApi.getBorrowingHistory();
      return Right(result
          .map((dto) => _borrowedBookEntityFactory.fromDto(dto))
          .toList());
    } catch (err) {
      return Left(ServerUnexpectedFailure());
    }
  }
}
