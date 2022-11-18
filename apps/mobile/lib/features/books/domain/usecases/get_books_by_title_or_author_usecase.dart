import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/core/domain/usecases/usecase.dart';
import 'package:mobile/core/error/failure.dart';
import 'package:mobile/features/books/domain/repositories/books_repository.dart';

import '../entities/book.dart';

@Injectable(env: ['dev', 'prod'])
class GetBooksByTitleOrAuthorUsecase
    extends UseCase<List<Book>, GetBooksByTitleOrAuthorParams> {
  final BooksRepository repository;

  GetBooksByTitleOrAuthorUsecase({required this.repository});

  @override
  Future<Either<Failure, List<Book>>> call(
      GetBooksByTitleOrAuthorParams params) {
    return repository.getBooks(titleOrAuthor: params.titleOrAuthor);
  }
}

class GetBooksByTitleOrAuthorParams extends Equatable {
  final String? titleOrAuthor;

  const GetBooksByTitleOrAuthorParams({this.titleOrAuthor});

  @override
  List<Object?> get props => [titleOrAuthor];
}
