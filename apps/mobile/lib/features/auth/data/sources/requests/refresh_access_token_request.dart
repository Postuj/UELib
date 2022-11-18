import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/core/data/models/dto.dart';

part 'refresh_access_token_request.g.dart';

@JsonSerializable()
class RefreshAccessTokenRequest extends Dto {
  final String refreshToken;

  RefreshAccessTokenRequest({required this.refreshToken});

  factory RefreshAccessTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$RefreshAccessTokenRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshAccessTokenRequestToJson(this);

  @override
  List<Object?> get props => [refreshToken];
}
