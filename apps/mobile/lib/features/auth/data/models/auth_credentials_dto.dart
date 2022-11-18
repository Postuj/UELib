import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/core/data/models/dto.dart';

part 'auth_credentials_dto.g.dart';

@JsonSerializable()
class AuthCredentialsDto extends Dto {
  final String accessToken;
  final String refreshToken;

  AuthCredentialsDto({required this.accessToken, required this.refreshToken})
      : super();

  factory AuthCredentialsDto.fromJson(Map<String, dynamic> json) =>
      _$AuthCredentialsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AuthCredentialsDtoToJson(this);

  @override
  List<Object?> get props => [accessToken, refreshToken];
}
