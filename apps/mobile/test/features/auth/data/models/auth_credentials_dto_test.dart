import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/features/auth/data/models/auth_credentials_dto.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tAuthCredentialsDto =
      AuthCredentialsDto(accessToken: '123', refreshToken: '123');

  test(
    'should deserialize to AuthCredentialsDto',
    () async {
      // arrange
      final jsonString = fixture('authCredentials.json');
      final json = jsonDecode(jsonString);
      // act
      final result = AuthCredentialsDto.fromJson(json);
      // assert
      expect(result, tAuthCredentialsDto);
    },
  );
}
