import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile/core/domain/usecases/usecase.dart';
import 'package:mobile/core/error/failure.dart';
import 'package:mobile/features/books/domain/repositories/books_repository.dart';

import '../entities/book.dart';

class GetBooksByTitleOrAuthor extends UseCase<List<Book>, Params> {
  final BooksRepository repository;

  GetBooksByTitleOrAuthor({required this.repository});

  @override
  Future<Either<Failure, List<Book>>> call(Params params) {
    return repository.getBooks(params.titleOrAuthor);
  }
}

class Params extends Equatable {
  final String? titleOrAuthor;

  const Params({this.titleOrAuthor});

  @override
  List<Object?> get props => [titleOrAuthor];
}
