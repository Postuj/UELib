import 'package:mobile/core/error/failure.dart';

abstract class AuthFailure extends Failure {}

abstract class TokenFailure extends AuthFailure {}

//* Access Token

class GetAccessTokenFailure extends TokenFailure {}

//* Refresh Token

class ExpiredRefreshTokenFailure extends TokenFailure {}

class GetRefreshTokenFailure extends TokenFailure {}
