import 'package:dio/dio.dart';

class ForbiddenError extends DioError {
  ForbiddenError({required super.requestOptions});
}
