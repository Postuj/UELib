import 'package:mobile/core/domain/entities/entity.dart';

class AuthCredentials extends Entity {
  final String accessToken;
  final String refreshToken;

  AuthCredentials({
    required this.accessToken,
    required this.refreshToken,
  });

  @override
  List<Object?> get props => [accessToken, refreshToken];
}
