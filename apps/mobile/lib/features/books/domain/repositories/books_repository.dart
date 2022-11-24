import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failure.dart';
import 'package:mobile/features/books/domain/entities/book_with_availability.dart';

import '../entities/book.dart';
import '../entities/borrowed_book.dart';

abstract class BooksRepository {
  Future<Either<Failure, Book>> getBookById(String id);
  Future<Either<Failure, List<Book>>> getBooks({String? titleOrAuthor});
  Future<Either<Failure, List<BorrowedBook>>> getCurrentlyBorrowedBooks();
  Future<Either<Failure, List<BorrowedBook>>> getBorrowingHistory();
  Future<Either<Failure, BookWithAvailability>> getBookWithAvailability(
    String id,
  );
  Future<Either<Failure, void>> borrowBook({
    required String id,
    required DateTime plannedDateOfReturn,
  });
}
