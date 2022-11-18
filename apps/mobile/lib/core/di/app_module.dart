import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/core/data/sources/dio/dio_factory.dart';
import 'package:mobile/core/data/sources/env.dart';

@module
abstract class AppModule {
  @Singleton(env: ['dev', 'prod'])
  Dio get dio => DioFactory(baseUrl: Env.apiUrl).create();
}
