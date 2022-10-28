import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/features/books/data/factories/author_model_factory.dart';
import 'package:mobile/features/books/data/factories/book_model_factory.dart';
import 'package:mobile/features/books/data/factories/genre_model_factory.dart';
import 'package:mobile/features/books/data/models/author_model.dart';
import 'package:mobile/features/books/data/models/book_model.dart';
import 'package:mobile/features/books/data/models/genre_model.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  late final BookModelFactory bookModelFactory;
  final tBookModel = BookModel(
    id: '123',
    title: 'Test',
    description: null,
    publishedAt: DateTime(2022, 10, 23),
    authorModel: AuthorModel(id: '123', name: 'Test', surname: 'Author'),
    genreModel: GenreModel(id: '123', name: 'Test'),
  );

  setUp(() {
    bookModelFactory = BookModelFactory(
      authorModelFactory: AuthorModelFactory(),
      genreModelFactory: GenreModelFactory(),
    );
  });

  test('should create a BookModel from JSON', () async {
    // arrange
    final Map<String, dynamic> jsonData = json.decode(fixture('book.json'));
    // act
    final result = bookModelFactory.fromJson(jsonData);
    // assert
    expect(result, tBookModel);
  });
}
