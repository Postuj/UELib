import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/features/books/data/models/author_dto.dart';
import 'package:mobile/features/books/data/models/borrowed_book_dto.dart';
import 'package:mobile/features/books/data/models/genre_dto.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tBorrowedBookDto = BorrowedBookDto(
    id: '123',
    title: 'Test',
    description: null,
    publishedAt: DateTime(2022, 10, 23),
    authorDto: AuthorDto(id: '123', name: 'Test', surname: 'Author'),
    genreDto: GenreDto(id: '123', name: 'Test'),
    borrowedAt: DateTime(2022, 11, 21),
    returnedAt: DateTime(2022, 11, 24),
    plannedDateOfReturn: DateTime(2022, 12, 5),
  );

  test(
    'should deserialize to BorrowedBookDto',
    () async {
      // arrange
      final jsonString = fixture('borrowed_book.json');
      final json = jsonDecode(jsonString);
      // act
      final result = BorrowedBookDto.fromJson(json);
      // assert
      expect(result, tBorrowedBookDto);
    },
  );
}
