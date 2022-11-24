import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/features/books/data/models/author_dto.dart';
import 'package:mobile/features/books/data/models/book_dto.dart';
import 'package:mobile/features/books/data/models/genre_dto.dart';

part 'borrowed_book_dto.g.dart';

@JsonSerializable(includeIfNull: false)
class BorrowedBookDto extends BookDto {
  final DateTime borrowedAt;
  final DateTime plannedDateOfReturn;
  final DateTime? returnedAt;

  BorrowedBookDto({
    required this.borrowedAt,
    required this.plannedDateOfReturn,
    required this.returnedAt,
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

  factory BorrowedBookDto.fromJson(Map<String, dynamic> json) =>
      _$BorrowedBookDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BorrowedBookDtoToJson(this);

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        publishedAt,
        authorDto,
        genreDto,
        borrowedAt,
        plannedDateOfReturn,
        returnedAt
      ];
}
