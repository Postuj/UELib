import 'package:dio/dio.dart';

class UnauthorizedError extends DioError {
  UnauthorizedError({required super.requestOptions});
}
