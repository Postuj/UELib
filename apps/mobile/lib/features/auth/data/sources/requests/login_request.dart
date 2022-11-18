import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/core/data/models/dto.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest extends Dto {
  final String email;
  final String password;

  LoginRequest({required this.email, required this.password});

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);

  @override
  List<Object?> get props => [email, password];
}
