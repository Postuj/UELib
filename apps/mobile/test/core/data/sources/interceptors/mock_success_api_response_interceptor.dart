import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockSuccessApiResponseInterceptor extends Interceptor {
  final String? jsonFile;

  MockSuccessApiResponseInterceptor({this.jsonFile});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.resolve(Response(
      statusCode: 200,
      requestOptions: options,
      data: jsonFile != null
          ? jsonDecode(
              fixture(jsonFile!),
            )
          : null,
    ));
  }
}
