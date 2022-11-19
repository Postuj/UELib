import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/features/books/data/models/author_dto.dart';
import 'package:mobile/features/books/data/models/book_with_availability_dto.dart';
import 'package:mobile/features/books/data/models/genre_dto.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tBookWithAvailabilityDto = BookWithAvailabilityDto(
    id: '123',
    title: 'Test',
    description: null,
    publishedAt: DateTime(2022, 10, 23),
    authorDto: AuthorDto(id: '123', name: 'Test', surname: 'Author'),
    genreDto: GenreDto(id: '123', name: 'Test'),
    isAvailable: true,
    plannedDateOfReturn: null,
  );

  test(
    'should deserialize to BookWithAvailabilityDto',
    () async {
      // arrange
      final jsonString = fixture('book_with_availability.json');
      final json = jsonDecode(jsonString);
      // act
      final result = BookWithAvailabilityDto.fromJson(json);
      // assert
      expect(result, tBookWithAvailabilityDto);
    },
  );
}
