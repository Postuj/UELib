import 'package:dio/dio.dart';
import 'package:mobile/core/data/sources/dio/error/forbidden_error.dart';
import 'package:mobile/core/data/sources/dio/error/internal_server_error.dart';
import 'package:mobile/core/data/sources/dio/error/not_found_error.dart';
import 'package:mobile/core/data/sources/dio/error/unathorized_error.dart';

class ResponseErrorInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      super.onResponse(response, handler);
    }

    DioError error = _getError(response);
    handler.reject(error);
  }

  DioError _getError(Response response) {
    switch (response.statusCode) {
      case 401:
        return UnauthorizedError(requestOptions: response.requestOptions);
      case 403:
        return ForbiddenError(requestOptions: response.requestOptions);
      case 404:
        return NotFoundError(requestOptions: response.requestOptions);
      case 500:
        return InternalServerError(requestOptions: response.requestOptions);
      default:
        return DioError(requestOptions: response.requestOptions);
    }
  }
}
