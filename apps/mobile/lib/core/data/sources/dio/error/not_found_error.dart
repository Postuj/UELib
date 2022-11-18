import 'package:dio/dio.dart';

class NotFoundError extends DioError {
  NotFoundError({required super.requestOptions});
}
