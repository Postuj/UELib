import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/features/books/data/models/author_model.dart';
import 'package:mobile/features/books/domain/entities/author.dart';

void main() {
  final tAuthorModel = AuthorModel(id: '123', name: 'Test', surname: 'Author');

  test(
    'should be a subclass of Author entity',
    () async {
      // assert
      expect(tAuthorModel, isA<Author>());
    },
  );
}
