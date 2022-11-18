import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/di/injection.dart';
import 'package:mobile/features/auth/domain/services/auth_service.dart';
import 'package:mobile/features/auth/domain/usecases/log_in_usecase.dart';
import 'package:mobile/features/auth/domain/usecases/log_out_usecase.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([
  MockSpec<FlutterSecureStorage>(),
  MockSpec<AuthService>(),
  MockSpec<LogInUsecase>(),
  MockSpec<LogOutUsecase>(),
])
import 'auth_test_module.mocks.dart';

@module
abstract class AuthTestModule {
  @testEnv
  FlutterSecureStorage get secureStorage => MockFlutterSecureStorage();
  @testEnv
  LogInUsecase get logInUsecase => MockLogInUsecase();
  @testEnv
  LogOutUsecase get logOutUsecase => MockLogOutUsecase();
  @testEnv
  AuthService get authService => MockAuthService();
}
