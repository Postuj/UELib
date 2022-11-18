import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/di/injection.dart';
import 'package:mobile/features/auth/domain/services/auth_service.dart';
import 'package:mobile/core/data/sources/dio/error/unathorized_error.dart';

import '../../../domain/error/auth_exception.dart';

@injectable
class AuthInterceptor extends Interceptor {
  final AuthService _authService;

  AuthInterceptor({
    required AuthService authService,
  }) : _authService = authService;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final requiresAuth = options.extra['requires-auth'] ?? true;

    if (requiresAuth) {
      try {
        _applyAccessToken(options);
      } on GetAccessTokenException catch (_) {
        handler.reject(UnauthorizedError(requestOptions: options));
        return;
      }
    }

    return super.onRequest(options, handler);
  }

  void _applyAccessToken(RequestOptions options) async {
    final result = await _authService.getAccessToken();
    final accessToken = result.fold(
      (l) => throw GetAccessTokenException(),
      (r) => r,
    );
    options.headers['Authorization'] = 'Bearer $accessToken';
  }
}

void attachAuthInterceptor() {
  Dio dio = getIt<Dio>();
  AuthInterceptor interceptor = getIt<AuthInterceptor>();
  dio.interceptors.add(interceptor);
}
