import 'package:dio/dio.dart';

class InternalServerError extends DioError {
  InternalServerError({required super.requestOptions});
}
