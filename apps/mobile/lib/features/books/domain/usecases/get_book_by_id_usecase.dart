import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/core/domain/usecases/usecase.dart';
import 'package:mobile/core/error/failure.dart';
import 'package:mobile/features/books/domain/entities/book.dart';
import 'package:mobile/features/books/domain/repositories/books_repository.dart';

@Injectable(env: ['dev', 'prod'])
class GetBookByIdUsecase extends UseCase<Book, GetBookByIdParams> {
  final BooksRepository _repository;

  GetBookByIdUsecase({required BooksRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, Book>> call(GetBookByIdParams params) {
    return _repository.getBookById(params.id);
  }
}

class GetBookByIdParams extends Equatable {
  final String id;

  const GetBookByIdParams({required this.id});

  @override
  List<Object> get props => [id];
}
