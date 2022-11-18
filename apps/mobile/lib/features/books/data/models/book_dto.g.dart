// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookDto _$BookDtoFromJson(Map<String, dynamic> json) => BookDto(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      publishedAt: DateTime.parse(json['publishedAt'] as String),
      authorDto: AuthorDto.fromJson(json['author'] as Map<String, dynamic>),
      genreDto: GenreDto.fromJson(json['genre'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookDtoToJson(BookDto instance) {
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
  return val;
}
