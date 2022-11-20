import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/core/data/sources/dio/interceptors/response_error_interceptor.dart';
import 'package:mobile/core/error/failure.dart';
import 'package:mobile/di/injection.dart';
import 'package:mobile/features/auth/data/factories/auth_credentials_entity_factory.dart';
import 'package:mobile/features/auth/data/services/auth_service_impl.dart';
import 'package:mobile/features/auth/data/sources/auth_api.dart';
import 'package:mobile/features/auth/data/sources/interceptors/auth_interceptor.dart';
import 'package:mobile/features/auth/domain/entities/auth_credentials.dart';
import 'package:mobile/features/auth/domain/error/auth_failure.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/data/sources/interceptors/mock_api_failure_interceptor.dart';
import '../../../../core/di/test_env_injection.dart';
import '../../../../core/test_env_setup.dart';
import '../../../../fixtures/fixture_reader.dart';

class SuccessAuthApiMockInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.path == '/login' || options.path == '/refresh-token') {
      handler.resolve(Response(
        statusCode: 200,
        requestOptions: options,
        data: jsonDecode(
          fixture('authCredentials.json'),
        ),
      ));
    } else if (options.path == '/logout') {
      handler.resolve(Response(requestOptions: options, statusCode: 200));
    } else {
      super.onRequest(options, handler);
    }
  }
}

void main() {
  late AuthServiceImpl service;
  late FlutterSecureStorage storage;
  late AuthApi api;
  late Dio dio;

  setUpAll(() async {
    await loadTestEnvVars();
    configureTestDependencyInjection();
  });

  setUp(() {
    dio = getIt<Dio>();
    dio.interceptors.addAll([ResponseErrorInterceptor()]);
    api = AuthApi(dio);
    storage = getIt<FlutterSecureStorage>();
    service = AuthServiceImpl(
      authApi: api,
      storage: storage,
      authCredentialsEntityFactory: getIt<AuthCredentialsEntityFactory>(),
    );
  });

  void setUpSuccessApiMock() {
    dio.interceptors.add(SuccessAuthApiMockInterceptor());
  }

  const tEmail = 'email';
  const tPassword = 'password';
  final tAuthCredentials =
      AuthCredentials(accessToken: '123', refreshToken: '123');
  const tValidJwt =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJVRUxpYiIsImlhdCI6MTY2ODM1OTAxMSwiZXhwIjoxNzQ3ODM0OTQxMSwiYXVkIjoid3d3LnVlbGliLmNvbSIsInN1YiI6ImRhd2lkQHBhc2lla2EuY29tIn0.KNTVrjq7CPg23OR4UaqotOLAnEmLnfsFnMYigFciqyM';
  const tInvalidJwt =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJVRUxpYiIsImlhdCI6MTY2ODM1OTAxMSwiZXhwIjoxNjA1Mjg3MDExLCJhdWQiOiJ3d3cudWVsaWIuY29tIiwic3ViIjoiZGF3aWRAcGFzaWVrYS5jb20ifQ.voXNgK78ZEYmNtB8bfxehhPzp6RPE-txZjIAhwPwwEg';

  group('Log in', () {
    test('should store AuthCredentials and return them on success', () async {
      // arrange
      setUpSuccessApiMock();
      // act
      final result = await service.logIn(tEmail, tPassword);
      // assert
      expect(result, Right(tAuthCredentials));
      verify(storage.write(key: 'accessToken', value: '123'));
      verify(storage.write(key: 'refreshToken', value: '123'));
      verifyNoMoreInteractions(storage);
    });

    test('should return UnathorizedServerFailure on UnauthorizedError',
        () async {
      // arrange
      dio.interceptors.add(MockApiFailureInterceptor(statusCode: 401));
      // act
      final result = await service.logIn(tEmail, tPassword);
      // assert
      expect(result, Left(ServerUnathorizedFailure()));
    });

    test('should return ForbiddenServerFailure on ForbiddenError', () async {
      // arrange
      dio.interceptors.add(MockApiFailureInterceptor(statusCode: 403));
      // act
      final result = await service.logIn(tEmail, tPassword);
      // assert
      expect(result, Left(ServerForbiddenFailure()));
    });
  });

  group('Log out', () {
    test('should delete AuthCredentials from store and return null on success',
        () async {
      // arrange
      setUpSuccessApiMock();
      // act
      final result = await service.logOut();
      // assert
      expect(result, const Right(null));
      verify(storage.deleteAll());
      verifyNoMoreInteractions(storage);
    });

    test(
        'should delete AuthCredentials from store and return UnathorizedServerFailure on UnauthorizedError',
        () async {
      // arrange
      dio.interceptors.add(MockApiFailureInterceptor(statusCode: 401));
      // act
      final result = await service.logOut();
      // assert
      expect(result, Left(ServerUnathorizedFailure()));
      verify(storage.deleteAll());
      verifyNoMoreInteractions(storage);
    });

    test('should append Authorization header on request', (() async {
      // arrange
      when(storage.read(key: 'accessToken'))
          .thenAnswer((_) async => tInvalidJwt);
      when(storage.read(key: 'refreshToken'))
          .thenAnswer((_) async => tValidJwt);
      dio.interceptors.add(AuthInterceptor(authService: service));
      setUpSuccessApiMock();
      // act
      final result = await service.logOut();
      // assert
      expect(result, const Right(null));
      verify(storage.write(key: 'accessToken', value: '123'));
      verify(storage.write(key: 'refreshToken', value: '123'));
      verify(storage.read(key: 'accessToken'));
      verify(storage.read(key: 'refreshToken'));
      verify(storage.deleteAll());
      verifyNoMoreInteractions(storage);
    }));
  });

  group('Get access token', () {
    test('should return access token if it is available', () async {
      // arrange
      when(storage.read(key: 'accessToken')).thenAnswer((_) async => tValidJwt);
      // act
      final result = await service.getAccessToken();
      // assert
      expect(result, const Right(tValidJwt));
      verify(storage.read(key: 'accessToken'));
      verifyNoMoreInteractions(storage);
    });

    test('should refresh accessToken if it is expired', () async {
      // arrange
      setUpSuccessApiMock();
      when(storage.read(key: 'accessToken'))
          .thenAnswer((_) async => tInvalidJwt);
      when(storage.read(key: 'refreshToken'))
          .thenAnswer((_) async => tValidJwt);
      // act
      final result = await service.getAccessToken();
      // assert
      expect(result, const Right('123'));
      verify(storage.read(key: 'accessToken'));
      verify(storage.read(key: 'refreshToken'));
      verify(storage.write(key: 'accessToken', value: '123'));
      verify(storage.write(key: 'refreshToken', value: '123'));
      verifyNoMoreInteractions(storage);
    });

    test('should refresh accessToken if it is null', () async {
      // arrange
      setUpSuccessApiMock();
      when(storage.read(key: 'accessToken')).thenAnswer((_) async => null);
      when(storage.read(key: 'refreshToken'))
          .thenAnswer((_) async => tValidJwt);
      // act
      final result = await service.getAccessToken();
      // assert
      expect(result, const Right('123'));
      verify(storage.read(key: 'accessToken'));
      verify(storage.read(key: 'refreshToken'));
      verify(storage.write(key: 'accessToken', value: '123'));
      verify(storage.write(key: 'refreshToken', value: '123'));
      verifyNoMoreInteractions(storage);
    });

    test('should return GetAccessTokenFailure if refreshToken is expired',
        () async {
      // arrange
      setUpSuccessApiMock();
      when(storage.read(key: 'accessToken'))
          .thenAnswer((_) async => tInvalidJwt);
      when(storage.read(key: 'refreshToken'))
          .thenAnswer((_) async => tInvalidJwt);
      // act
      final result = await service.getAccessToken();
      // assert
      expect(result, Left(GetAccessTokenFailure()));
      verify(storage.read(key: 'accessToken'));
      verify(storage.read(key: 'refreshToken'));
      verifyNoMoreInteractions(storage);
    });

    test('should return GetAccessTokenFailure if refreshToken is null',
        () async {
      // arrange
      setUpSuccessApiMock();
      when(storage.read(key: 'accessToken'))
          .thenAnswer((_) async => tInvalidJwt);
      when(storage.read(key: 'refreshToken')).thenAnswer((_) async => null);
      // act
      final result = await service.getAccessToken();
      // assert
      expect(result, Left(GetAccessTokenFailure()));
      verify(storage.read(key: 'accessToken'));
      verify(storage.read(key: 'refreshToken'));
      verifyNoMoreInteractions(storage);
    });
  });
}
