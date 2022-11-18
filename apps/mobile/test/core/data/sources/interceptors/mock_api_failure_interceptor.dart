import 'package:dio/dio.dart';

class MockApiFailureInterceptor extends Interceptor {
  final int statusCode;
  MockApiFailureInterceptor({required this.statusCode});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.resolve(
      Response(
        requestOptions: options,
        statusCode: statusCode,
      ),
      true,
    );
  }
}
