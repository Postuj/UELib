import 'package:injectable/injectable.dart';
import 'package:mobile/core/data/factories/entity_factory.dart';
import 'package:mobile/features/auth/data/models/auth_credentials_dto.dart';
import 'package:mobile/features/auth/domain/entities/auth_credentials.dart';

@injectable
class AuthCredentialsEntityFactory
    extends EntityFactory<AuthCredentials, AuthCredentialsDto> {
  @override
  AuthCredentials fromDto(AuthCredentialsDto dto) => AuthCredentials(
      accessToken: dto.accessToken, refreshToken: dto.refreshToken);
}
