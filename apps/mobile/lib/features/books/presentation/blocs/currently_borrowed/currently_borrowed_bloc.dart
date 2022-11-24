import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/core/domain/usecases/usecase.dart';
import 'package:mobile/features/books/domain/entities/borrowed_book.dart';
import 'package:mobile/features/books/domain/usecases/get_currently_borrowed_books_usecase.dart';

part 'currently_borrowed_event.dart';
part 'currently_borrowed_state.dart';

@Singleton(env: ['dev', 'prod'])
class CurrentlyBorrowedBloc
    extends Bloc<CurrentlyBorrowedEvent, CurrentlyBorrowedState> {
  final GetCurrentlyBorrowedBooksUsecase _getCurrentlyBorrowedBooksUsecase;

  CurrentlyBorrowedBloc(
      {required GetCurrentlyBorrowedBooksUsecase
          getCurrentlyBorrowedBooksUsecase})
      : _getCurrentlyBorrowedBooksUsecase = getCurrentlyBorrowedBooksUsecase,
        super(const CurrentlyBorrowedEmptyState()) {
    on<GetCurrentlyBorrowedEvent>(_handleGetEvent);
  }

  Future<void> _handleGetEvent(GetCurrentlyBorrowedEvent event,
      Emitter<CurrentlyBorrowedState> emit) async {
    emit(const CurrentlyBorrowedLoadingState());
    final result = await _getCurrentlyBorrowedBooksUsecase(const NoParams());
    result.fold((l) => emit(const CurrentlyBorrowedErrorState()), (r) {
      emit(CurrentlyBorrowedLoadedState(books: r));
    });
  }
}
