import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/features/auth/data/models/user_dto.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tUserDto = UserDto(id: '123', email: 'test@email.com');

  test(
    'should deserialize to UserDto',
    () async {
      // arrange
      final jsonString = fixture('user.json');
      final json = jsonDecode(jsonString);
      // act
      final result = UserDto.fromJson(json);
      // assert
      expect(result, tUserDto);
    },
  );
}
