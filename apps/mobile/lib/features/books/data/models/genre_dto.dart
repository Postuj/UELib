import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/core/data/models/identifiable_dto.dart';

part 'genre_dto.g.dart';

@JsonSerializable()
class GenreDto extends IdentifiableDto {
  final String name;

  GenreDto({
    required String id,
    required this.name,
  }) : super(id);

  factory GenreDto.fromJson(Map<String, dynamic> json) =>
      _$GenreDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GenreDtoToJson(this);

  @override
  List<Object?> get props => [id, name];
}
