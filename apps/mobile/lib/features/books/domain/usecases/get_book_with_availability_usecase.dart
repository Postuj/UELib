import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile/core/domain/usecases/usecase.dart';
import 'package:mobile/core/error/failure.dart';
import 'package:mobile/features/books/domain/entities/book_with_availability.dart';
import 'package:mobile/features/books/domain/repositories/books_repository.dart';

class GetBookWithAvailabilityUsecase
    extends UseCase<BookWithAvailability, GetBookWithAvailabilityParams> {
  final BooksRepository _booksRepository;

  GetBookWithAvailabilityUsecase({required BooksRepository repository})
      : _booksRepository = repository;

  @override
  Future<Either<Failure, BookWithAvailability>> call(
      GetBookWithAvailabilityParams params) {
    return _booksRepository.getBookWithAvailability(params.id);
  }
}

class GetBookWithAvailabilityParams extends Equatable {
  final String id;

  const GetBookWithAvailabilityParams({required this.id});

  @override
  List<Object> get props => [id];
}
