import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/core/domain/usecases/usecase.dart';
import 'package:mobile/core/error/failure.dart';
import 'package:mobile/features/books/domain/entities/borrowed_book.dart';

import '../repositories/books_repository.dart';

@Injectable(env: ['dev', 'prod'])
class GetBorrowingHistoryUsecase extends UseCase<List<BorrowedBook>, NoParams> {
  final BooksRepository _booksRepository;

  GetBorrowingHistoryUsecase({required BooksRepository repository})
      : _booksRepository = repository;

  @override
  Future<Either<Failure, List<BorrowedBook>>> call(NoParams params) {
    return _booksRepository.getBorrowingHistory();
  }
}
