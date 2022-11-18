import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/features/auth/data/models/auth_credentials_dto.dart';
import 'package:mobile/features/auth/data/sources/requests/auth_requests_annotations.dart';
import 'package:mobile/features/auth/data/sources/requests/login_request.dart';
import 'package:mobile/features/auth/data/sources/requests/refresh_access_token_request.dart';
import 'package:retrofit/http.dart';

import '../../../../core/data/sources/env.dart';

part 'auth_api.g.dart';

@injectable
@RestApi(baseUrl: 'http://localhost:3000/auth')
abstract class AuthApi {
  @factoryMethod
  static AuthApi create(Dio dio) =>
      _AuthApi(dio, baseUrl: '${Env.apiUrl}/auth');

  factory AuthApi(Dio dio) => _AuthApi(dio);

  @withoutAuth
  @POST('/login')
  Future<AuthCredentialsDto> logIn(@Body() LoginRequest body);

  @withoutAuth
  @POST('/refresh-token')
  Future<AuthCredentialsDto> refreshAccessToken(
    @Body() RefreshAccessTokenRequest body,
  );

  @POST('/logout')
  Future<void> logOut();
}
