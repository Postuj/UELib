import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/features/books/data/factories/genre_model_factory.dart';
import 'package:mobile/features/books/data/models/genre_model.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  late final GenreModelFactory genreModelFactory;
  final tGenreModel = GenreModel(id: '123', name: 'Test');

  setUp(() {
    genreModelFactory = GenreModelFactory();
  });

  test('should create a GenreModel from JSON', () async {
    // arrange
    final Map<String, dynamic> jsonData = json.decode(fixture('genre.json'));
    // act
    final result = genreModelFactory.fromJson(jsonData);
    // assert
    expect(result, tGenreModel);
  });
}
