import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/features/books/domain/entities/book_with_availability.dart';
import 'package:mobile/features/books/domain/usecases/get_book_with_availability_usecase.dart';
import 'package:mobile/features/borrow_book/usecases/borrow_book_usecase.dart';

part 'borrow_book_event.dart';
part 'borrow_book_state.dart';

@injectable
class BorrowBookBloc extends Bloc<BorrowBookEvent, BorrowBookState> {
  final GetBookWithAvailabilityUsecase _getBookWithAvailabilityUsecase;
  final BorrowBookUsecase _borrowBookUsecase;

  BorrowBookBloc({
    required GetBookWithAvailabilityUsecase getBookWithAvailabilityUsecase,
    required BorrowBookUsecase borrowBookUsecase,
  })  : _getBookWithAvailabilityUsecase = getBookWithAvailabilityUsecase,
        _borrowBookUsecase = borrowBookUsecase,
        super(BorrowBookScanningState()) {
    on<BorrowBookScannedEvent>(_handleBookScannedEvent);
    on<BorrowBookBorrowEvent>(_handleBookBorrowEvent);
  }

  Future<void> _handleBookScannedEvent(
      BorrowBookScannedEvent event, Emitter<BorrowBookState> emit) async {
    emit(BorrowBookLoadingState());
    final result = await _getBookWithAvailabilityUsecase(
        GetBookWithAvailabilityParams(id: event.bookId));
    result.fold((l) => emit(BorrowBookErrorState()),
        (r) => emit(BorrowBookLoadedState(book: r)));
  }

  Future<void> _handleBookBorrowEvent(
      BorrowBookBorrowEvent event, Emitter<BorrowBookState> emit) async {
    if (state is! BorrowBookLoadedState) {
      emit(BorrowBookErrorState());
    }

    final BookWithAvailability book = (state as BorrowBookLoadedState).book;

    emit(BorrowBookBorrowingLoadingState(book: book));
    final result = await _borrowBookUsecase(BorrowBookUsecaseParams(
      id: event.bookId,
      plannedDateOfReturn: event.plannedDateOfReturn,
    ));

    result.fold(
      (l) => emit(BorrowBookBorrowingErrorState(book: book)),
      (r) => emit(BorrowBookBorrowedState(book: book)),
    );
  }
}
