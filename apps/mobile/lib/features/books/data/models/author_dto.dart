import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/core/data/models/identifiable_dto.dart';

part 'author_dto.g.dart';

@JsonSerializable()
class AuthorDto extends IdentifiableDto {
  final String name;
  final String surname;

  AuthorDto({
    required String id,
    required this.name,
    required this.surname,
  }) : super(id);

  factory AuthorDto.fromJson(Map<String, dynamic> json) =>
      _$AuthorDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorDtoToJson(this);

  @override
  List<Object?> get props => [id, name, surname];
}
