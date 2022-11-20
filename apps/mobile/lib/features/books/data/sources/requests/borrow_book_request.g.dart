// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'borrow_book_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BorrowBookRequest _$BorrowBookRequestFromJson(Map<String, dynamic> json) =>
    BorrowBookRequest(
      plannedDateOfReturn:
          DateTime.parse(json['plannedDateOfReturn'] as String),
    );

Map<String, dynamic> _$BorrowBookRequestToJson(BorrowBookRequest instance) =>
    <String, dynamic>{
      'plannedDateOfReturn': instance.plannedDateOfReturn.toIso8601String(),
    };
