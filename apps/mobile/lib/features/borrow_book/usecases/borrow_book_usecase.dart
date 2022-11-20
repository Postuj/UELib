import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/core/domain/usecases/usecase.dart';
import 'package:mobile/core/error/failure.dart';
import 'package:mobile/features/books/domain/repositories/books_repository.dart';

@Injectable(env: ['dev', 'prod'])
class BorrowBookUsecase extends UseCase<void, BorrowBookUsecaseParams> {
  final BooksRepository _booksRepository;

  BorrowBookUsecase({required BooksRepository booksRepository})
      : _booksRepository = booksRepository;

  @override
  Future<Either<Failure, void>> call(BorrowBookUsecaseParams params) async {
    await Future.delayed(const Duration(seconds: 1));
    return _booksRepository.borrowBook(
      id: params.id,
      plannedDateOfReturn: params.plannedDateOfReturn,
    );
  }
}

class BorrowBookUsecaseParams extends Equatable {
  final String id;
  final DateTime plannedDateOfReturn;

  const BorrowBookUsecaseParams(
      {required this.id, required this.plannedDateOfReturn});

  @override
  List<Object> get props => [id, plannedDateOfReturn];
}
