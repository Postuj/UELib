import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/features/books/data/models/genre_dto.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tGenreDto = GenreDto(id: '123', name: 'Test');

  test(
    'should deserialize to GenreDto',
    () async {
      // arrange
      final jsonString = fixture('genre.json');
      final json = jsonDecode(jsonString);
      // act
      final result = GenreDto.fromJson(json);
      // assert
      expect(result, tGenreDto);
    },
  );
}
