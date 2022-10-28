import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/features/books/data/factories/author_model_factory.dart';
import 'package:mobile/features/books/data/models/author_model.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  late final AuthorModelFactory authorModelFactory;
  final tAuthorModel = AuthorModel(id: '123', name: 'Test', surname: 'Author');

  setUp(() {
    authorModelFactory = AuthorModelFactory();
  });

  test('should create an AuthorModel from JSON', () async {
    // arrange
    final Map<String, dynamic> jsonData = json.decode(fixture('author.json'));
    // act
    final result = authorModelFactory.fromJson(jsonData);
    // assert
    expect(result, tAuthorModel);
  });
}
