// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'borrowed_book_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BorrowedBookDto _$BorrowedBookDtoFromJson(Map<String, dynamic> json) =>
    BorrowedBookDto(
      borrowedAt: DateTime.parse(json['borrowedAt'] as String),
      plannedDateOfReturn:
          DateTime.parse(json['plannedDateOfReturn'] as String),
      returnedAt: json['returnedAt'] == null
          ? null
          : DateTime.parse(json['returnedAt'] as String),
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      publishedAt: DateTime.parse(json['publishedAt'] as String),
      authorDto: AuthorDto.fromJson(json['author'] as Map<String, dynamic>),
      genreDto: GenreDto.fromJson(json['genre'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BorrowedBookDtoToJson(BorrowedBookDto instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'title': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  val['publishedAt'] = instance.publishedAt.toIso8601String();
  val['author'] = instance.authorDto;
  val['genre'] = instance.genreDto;
  val['borrowedAt'] = instance.borrowedAt.toIso8601String();
  val['plannedDateOfReturn'] = instance.plannedDateOfReturn.toIso8601String();
  writeNotNull('returnedAt', instance.returnedAt?.toIso8601String());
  return val;
}
