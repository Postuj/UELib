part of 'borrowing_history_bloc.dart';

abstract class BorrowingHistoryEvent extends Equatable {
  const BorrowingHistoryEvent();

  @override
  List<Object> get props => [];
}

class GetBorrowingHistoryEvent extends BorrowingHistoryEvent {
  const GetBorrowingHistoryEvent();
}
