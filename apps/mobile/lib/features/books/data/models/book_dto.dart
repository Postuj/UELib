import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/core/data/models/identifiable_dto.dart';

import 'author_dto.dart';
import 'genre_dto.dart';

part 'book_dto.g.dart';

@JsonSerializable(includeIfNull: false)
class BookDto extends IdentifiableDto {
  final String title;
  final String? description;
  final DateTime publishedAt;
  @JsonKey(name: 'author')
  final AuthorDto authorDto;
  @JsonKey(name: 'genre')
  final GenreDto genreDto;

  BookDto({
    required String id,
    required this.title,
    this.description,
    required this.publishedAt,
    required this.authorDto,
    required this.genreDto,
  }) : super(id);

  factory BookDto.fromJson(Map<String, dynamic> json) =>
      _$BookDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BookDtoToJson(this);

  @override
  List<Object?> get props => [id, title, description];
}
