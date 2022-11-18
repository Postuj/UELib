import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/core/data/models/identifiable_dto.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto extends IdentifiableDto {
  final String email;

  UserDto({required String id, required this.email}) : super(id);

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  @override
  List<Object?> get props => [email, id];
}
