import 'package:dio/dio.dart';

class DioFactory {
  final String _baseUrl;

  DioFactory({
    required String baseUrl,
  }) : _baseUrl = baseUrl;

  Dio create() => Dio(_makeBaseOptions());

  BaseOptions _makeBaseOptions() => BaseOptions(
        baseUrl: _baseUrl,
        receiveTimeout: 15000,
        sendTimeout: 15000,
      );
}
