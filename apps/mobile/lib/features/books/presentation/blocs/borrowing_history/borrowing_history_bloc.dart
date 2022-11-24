import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/core/domain/usecases/usecase.dart';
import 'package:mobile/features/books/domain/usecases/get_borrowing_history_usecase.dart';

import '../../../domain/entities/borrowed_book.dart';

part 'borrowing_history_event.dart';
part 'borrowing_history_state.dart';

@injectable
class BorrowingHistoryBloc
    extends Bloc<BorrowingHistoryEvent, BorrowingHistoryState> {
  final GetBorrowingHistoryUsecase _getBorrowingHistoryUsecase;

  BorrowingHistoryBloc(
      {required GetBorrowingHistoryUsecase getBorrowingHistoryUsecase})
      : _getBorrowingHistoryUsecase = getBorrowingHistoryUsecase,
        super(const BorrowingHistoryEmptyState()) {
    on<GetBorrowingHistoryEvent>(_handleGetEvent);
  }

  FutureOr<void> _handleGetEvent(GetBorrowingHistoryEvent event,
      Emitter<BorrowingHistoryState> emit) async {
    emit(const BorrowingHistoryLoadingState());
    final result = await _getBorrowingHistoryUsecase(const NoParams());
    result.fold((l) => emit(const BorrowingHistoryErrorState()),
        (r) => emit(BorrowingHistoryLoadedState(books: r)));
  }
}
