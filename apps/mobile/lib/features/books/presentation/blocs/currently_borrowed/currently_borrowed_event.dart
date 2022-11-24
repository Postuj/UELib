part of 'currently_borrowed_bloc.dart';

abstract class CurrentlyBorrowedEvent extends Equatable {
  const CurrentlyBorrowedEvent();

  @override
  List<Object> get props => [];
}

class GetCurrentlyBorrowedEvent extends CurrentlyBorrowedEvent {
  const GetCurrentlyBorrowedEvent();
}
