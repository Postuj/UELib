import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/core/data/models/dto.dart';

part 'borrow_book_request.g.dart';

@JsonSerializable()
class BorrowBookRequest extends Dto {
  final DateTime plannedDateOfReturn;

  BorrowBookRequest({required this.plannedDateOfReturn});

  factory BorrowBookRequest.fromJson(Map<String, dynamic> json) =>
      _$BorrowBookRequestFromJson(json);

  Map<String, dynamic> toJson() => _$BorrowBookRequestToJson(this);

  @override
  List<Object?> get props => [plannedDateOfReturn];
}
