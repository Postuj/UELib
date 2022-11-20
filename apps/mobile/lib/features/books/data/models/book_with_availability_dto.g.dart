// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_with_availability_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookWithAvailabilityDto _$BookWithAvailabilityDtoFromJson(
        Map<String, dynamic> json) =>
    BookWithAvailabilityDto(
      isAvailable: json['isAvailable'] as bool,
      plannedDateOfReturn: json['plannedDateOfReturn'] == null
          ? null
          : DateTime.parse(json['plannedDateOfReturn'] as String),
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      publishedAt: DateTime.parse(json['publishedAt'] as String),
      authorDto: AuthorDto.fromJson(json['author'] as Map<String, dynamic>),
      genreDto: GenreDto.fromJson(json['genre'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookWithAvailabilityDtoToJson(
    BookWithAvailabilityDto instance) {
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
  val['isAvailable'] = instance.isAvailable;
  writeNotNull(
      'plannedDateOfReturn', instance.plannedDateOfReturn?.toIso8601String());
  return val;
}
