import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/di/injection.dart';
import 'package:mobile/features/auth/domain/entities/auth_credentials.dart';
import 'package:mobile/features/auth/domain/services/auth_service.dart';
import 'package:mobile/features/auth/domain/usecases/log_in_usecase.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/di/test_env_injection.dart';
import '../../../../core/test_env_setup.dart';

void main() {
  late AuthService authService;
  late LogInUsecase usecase;

  setUpAll(() async {
    await loadTestEnvVars();
    configureTestDependencyInjection();
  });

  setUp(() {
    authService = getIt<AuthService>();
    usecase = LogInUsecase(authService: authService);
  });

  const tEmail = 'email';
  const tPassword = 'password';
  final tAuthCredentials =
      AuthCredentials(accessToken: '123', refreshToken: '123');

  test('should log in', () async {
    // arrange
    when(authService.logIn(tEmail, tPassword))
        .thenAnswer((_) async => Right(tAuthCredentials));
    // act
    final result =
        await usecase(const LogInParams(email: tEmail, password: tPassword));
    // assert
    expect(result, Right(tAuthCredentials));
    verify(authService.logIn(tEmail, tPassword));
    verifyNoMoreInteractions(authService);
  });
}
