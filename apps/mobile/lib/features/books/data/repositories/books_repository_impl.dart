import 'package:mobile/features/books/data/sources/books_api.dart';
import 'package:mobile/features/books/domain/entities/book.dart';
import 'package:mobile/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:mobile/features/books/domain/repositories/books_repository.dart';

class BooksRepositoryImpl implements BooksRepository {
  final BooksApi booksApi;

  BooksRepositoryImpl({
    required this.booksApi,
  });

  @override
  Future<Either<Failure, Book>> getBookById(String id) async {
    return Right(await booksApi.getBookById(id));
  }

  @override
  Future<Either<Failure, List<Book>>> getBooks([String? titleOrAuthor]) async {
    if (titleOrAuthor != null) {
      return Right(await booksApi.getBooksByTitleOrAuthor(titleOrAuthor));
    }

    return Right(await booksApi.getAllBooks());
  }
}
