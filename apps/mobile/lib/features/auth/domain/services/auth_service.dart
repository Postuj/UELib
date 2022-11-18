import 'package:dartz/dartz.dart';
import 'package:mobile/core/error/failure.dart';
import 'package:mobile/features/auth/domain/entities/auth_credentials.dart';

import '../error/auth_failure.dart';

abstract class AuthService {
  Future<Either<Failure, AuthCredentials>> logIn(String email, String password);
  Future<Either<Failure, void>> logOut();
  Future<Either<TokenFailure, String>> getAccessToken();
  Future<bool> getIsAuthenticated();
}
