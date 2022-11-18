// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_credentials_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthCredentialsDto _$AuthCredentialsDtoFromJson(Map<String, dynamic> json) =>
    AuthCredentialsDto(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$AuthCredentialsDtoToJson(AuthCredentialsDto instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
