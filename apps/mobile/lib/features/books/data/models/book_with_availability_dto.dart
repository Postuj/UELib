import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/features/books/data/models/author_dto.dart';
import 'package:mobile/features/books/data/models/book_dto.dart';
import 'package:mobile/features/books/data/models/genre_dto.dart';

part 'book_with_availability_dto.g.dart';

@JsonSerializable(includeIfNull: false)
class BookWithAvailabilityDto extends BookDto {
  final bool isAvailable;
  final DateTime? plannedDateOfReturn;

  BookWithAvailabilityDto({
    required this.isAvailable,
    required this.plannedDateOfReturn,
    required String id,
    required String title,
    required String? description,
    required DateTime publishedAt,
    required AuthorDto authorDto,
    required GenreDto genreDto,
  }) : super(
          id: id,
          title: title,
          description: description,
          publishedAt: publishedAt,
          authorDto: authorDto,
          genreDto: genreDto,
        );

  factory BookWithAvailabilityDto.fromJson(Map<String, dynamic> json) =>
      _$BookWithAvailabilityDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BookWithAvailabilityDtoToJson(this);

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        publishedAt,
        authorDto,
        genreDto,
        isAvailable,
        plannedDateOfReturn
      ];
}
