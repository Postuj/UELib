import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failure.dart';

import '../entities/book.dart';

abstract class BooksRepository {
  Future<Either<Failure, Book>> getBookById(String id);
  Future<Either<Failure, List<Book>>> getBooks([String? titleOrAuthor]);
}
