import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/core/domain/usecases/usecase.dart';
import 'package:mobile/di/injection.dart';
import 'package:mobile/features/auth/domain/services/auth_service.dart';
import 'package:mobile/features/auth/domain/usecases/log_out_usecase.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/di/test_env_injection.dart';
import '../../../../core/test_env_setup.dart';

void main() {
  late AuthService authService;
  late LogOutUsecase usecase;

  setUpAll(() async {
    await loadTestEnvVars();
    configureTestDependencyInjection();
  });

  setUp(() {
    authService = getIt<AuthService>();
    usecase = LogOutUsecase(authService: authService);
  });

  test('should log out', () async {
    // arrange
    when(authService.logOut()).thenAnswer((_) async => const Right(null));
    // act
    final result = await usecase(const NoParams());
    // assert
    expect(result, const Right(null));
    verify(authService.logOut());
    verifyNoMoreInteractions(authService);
  });
}
