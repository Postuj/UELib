import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/core/domain/usecases/usecase.dart';
import 'package:mobile/core/error/failure.dart';
import 'package:mobile/core/presentation/router/router.dart';
import 'package:mobile/di/injection.dart';
import 'package:mobile/features/auth/domain/entities/auth_credentials.dart';
import 'package:mobile/features/auth/domain/usecases/log_in_usecase.dart';
import 'package:mobile/features/auth/domain/usecases/log_out_usecase.dart';
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:mockito/mockito.dart';

import '../../../core/di/test_env_injection.dart';
import '../../../core/test_env_setup.dart';

void main() {
  late AuthBloc bloc;
  late LogInUsecase logIn;
  late LogOutUsecase logOut;
  late AppRouter router;

  setUpAll(() async {
    await loadTestEnvVars();
    configureTestDependencyInjection();
  });

  setUp(() {
    logIn = getIt<LogInUsecase>();
    logOut = getIt<LogOutUsecase>();
    router = getIt<AppRouter>();
    bloc = AuthBloc(logIn: logIn, logOut: logOut, router: router);
  });

  test('Initial state should be AuthNotAuthenticatedState', () {
    // assert
    expect(bloc.state, equals(AuthNotAuthenticatedState()));
  });

  group('Log in', () {
    const tEmail = 'email';
    const tPassword = 'password';
    final tAuthCredentials =
        AuthCredentials(accessToken: '123', refreshToken: '123');

    test(
        'should emit [AuthLoadingState, AuthAuthenticatedState] on usecase success',
        () {
      // arrange
      when(logIn(const LogInParams(email: tEmail, password: tPassword)))
          .thenAnswer((_) async => Right(tAuthCredentials));
      // assert later
      final expected = [AuthLoadingState(), AuthAuthenticatedState()];
      expectLater(bloc.stream, emitsInOrder(expected));
      // act
      bloc.add(const LogInEvent(email: tEmail, password: tPassword));
    });

    test('should emit [AuthLoadingState, AuthErrorState] on usecase failure',
        () {
      // arrange
      when(logIn(const LogInParams(email: tEmail, password: tPassword)))
          .thenAnswer((_) async => Left(ServerUnathorizedFailure()));
      // assert later
      final expected = [AuthLoadingState(), AuthErrorState()];
      expectLater(bloc.stream, emitsInOrder(expected));
      // act
      bloc.add(const LogInEvent(email: tEmail, password: tPassword));
    });
  });

  group('Log out', () {
    test('should emit [AuthAuthenticatedState] on usecase success', () {
      // arrange
      when(logOut(const NoParams())).thenAnswer((_) async => const Right(null));
      // assert later
      final expected = [AuthNotAuthenticatedState()];
      expectLater(bloc.stream, emitsInOrder(expected));
      // act
      bloc.add(LogOutEvent());
    });

    test('should emit [AuthErrorState] on usecase failure', () {
      // arrange
      when(logOut(const NoParams()))
          .thenAnswer((_) async => Left(ServerUnathorizedFailure()));
      // assert later
      final expected = [AuthErrorState()];
      expectLater(bloc.stream, emitsInOrder(expected));
      // act
      bloc.add(LogOutEvent());
    });
  });
}
