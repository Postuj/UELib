import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile/core/domain/usecases/usecase.dart';
import 'package:mobile/core/error/failure.dart';
import 'package:mobile/features/books/domain/entities/book.dart';
import 'package:mobile/features/books/domain/repositories/books_repository.dart';

class GetBookById extends UseCase<Book, Params> {
  final BooksRepository repository;

  GetBookById({required this.repository});

  @override
  Future<Either<Failure, Book>> call(Params params) {
    return repository.getBookById(params.id);
  }
}

class Params extends Equatable {
  final String id;

  const Params({required this.id});

  @override
  List<Object> get props => [id];
}
