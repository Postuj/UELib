import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/core/presentation/router/router.dart';
import 'package:mobile/di/injection.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<AppRouter>()])
import 'test_module.mocks.dart';

@module
abstract class TestModule {
  @testEnv
  Dio get dio => Dio();

  @testEnv
  AppRouter get router => MockAppRouter();
}
