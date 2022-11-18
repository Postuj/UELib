import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/features/books/data/models/author_dto.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tAuthorDto = AuthorDto(id: '123', name: 'Test', surname: 'Author');

  test(
    'should deserialize to AuthorDto',
    () async {
      // arrange
      final jsonString = fixture('author.json');
      final json = jsonDecode(jsonString);
      // act
      final result = AuthorDto.fromJson(json);
      // assert
      expect(result, tAuthorDto);
    },
  );
}
