import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mobile/core/data/sources/dio/error/forbidden_error.dart';
import 'package:mobile/core/data/sources/dio/error/unathorized_error.dart';
import 'package:mobile/features/auth/data/factories/auth_credentials_entity_factory.dart';
import 'package:mobile/features/auth/data/sources/requests/login_request.dart';
import 'package:mobile/features/auth/data/sources/requests/refresh_access_token_request.dart';
import 'package:mobile/features/auth/domain/entities/auth_credentials.dart';
import 'package:mobile/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:mobile/features/auth/domain/error/auth_failure.dart';
import 'package:mobile/features/auth/domain/services/auth_service.dart';

import '../sources/auth_api.dart';

@Injectable(as: AuthService, env: ['dev', 'prod'])
class AuthServiceImpl implements AuthService {
  final AuthApi _authApi;
  final FlutterSecureStorage _storage;
  final AuthCredentialsEntityFactory _authCredentialsEntityFactory;

  AuthServiceImpl({
    required AuthApi authApi,
    required FlutterSecureStorage storage,
    required AuthCredentialsEntityFactory authCredentialsEntityFactory,
  })  : _authApi = authApi,
        _storage = storage,
        _authCredentialsEntityFactory = authCredentialsEntityFactory;

  @override
  Future<Either<Failure, AuthCredentials>> logIn(
    String email,
    String password,
  ) async {
    try {
      final result = await _authApi.logIn(
        LoginRequest(email: email, password: password),
      );
      final authCredentials = _authCredentialsEntityFactory.fromDto(result);
      await _storeTokens(authCredentials);
      return Right(authCredentials);
    } on UnauthorizedError catch (_) {
      return Left(ServerUnathorizedFailure());
    } on ForbiddenError catch (_) {
      return Left(ServerForbiddenFailure());
    } catch (_) {
      return Left(ServerUnexpectedFailure());
    }
  }

  @override
  Future<Either<Failure, void>> logOut() async {
    try {
      await _authApi.logOut();
    } on UnauthorizedError catch (_) {
      _deleteTokens();
      return Left(ServerUnathorizedFailure());
    } catch (_) {
      _deleteTokens();
      return Left(ServerUnexpectedFailure());
    }
    _deleteTokens();
    return const Right(null);
  }

  @override
  Future<Either<TokenFailure, String>> getAccessToken() async {
    var accessToken = await _getAccessTokenFromStorage();
    if (accessToken == null || _checkIfTokenExpired(accessToken)) {
      final result = await _refreshAccessToken();
      return result.fold(
        (l) => Left(GetAccessTokenFailure()),
        (r) => Right(r.accessToken),
      );
    }

    return Right(accessToken);
  }

  @override
  Future<bool> getIsAuthenticated() async {
    var accessToken = await _getAccessTokenFromStorage();
    if (accessToken == null || _checkIfTokenExpired(accessToken)) {
      return false;
    }

    var refreshToken = await _getAccessTokenFromStorage();
    if (refreshToken == null || _checkIfTokenExpired(refreshToken)) {
      return false;
    }

    return true;
  }

  Future<Either<Failure, AuthCredentials>> _refreshAccessToken() async {
    final refreshToken = await _getRefreshTokenFromStorage();
    if (refreshToken == null) return Left(GetRefreshTokenFailure());
    if (_checkIfTokenExpired(refreshToken)) {
      return Left(ExpiredRefreshTokenFailure());
    }

    try {
      final result = await _authApi.refreshAccessToken(
        RefreshAccessTokenRequest(refreshToken: refreshToken),
      );

      final authCredentials = _authCredentialsEntityFactory.fromDto(result);
      await _storeTokens(authCredentials);
      return Right(authCredentials);
    } on UnauthorizedError catch (_) {
      return Left(ServerUnathorizedFailure());
    } catch (_) {
      return Left(ServerUnexpectedFailure());
    }
  }

  Future<String?> _getRefreshTokenFromStorage() {
    return _storage.read(key: 'refreshToken');
  }

  Future<String?> _getAccessTokenFromStorage() {
    return _storage.read(key: 'accessToken');
  }

  Future<void> _storeTokens(AuthCredentials authCredentials) async {
    await _storage.write(
        key: 'accessToken', value: authCredentials.accessToken);
    await _storage.write(
        key: 'refreshToken', value: authCredentials.refreshToken);
  }

  Future<void> _deleteTokens() async {
    await _storage.deleteAll();
  }

  bool _checkIfTokenExpired(String token) {
    return JwtDecoder.isExpired(token);
  }
}
