import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/features/books/data/models/author_model.dart';
import 'package:mobile/features/books/data/models/book_model.dart';
import 'package:mobile/features/books/data/models/genre_model.dart';
import 'package:mobile/features/books/domain/entities/book.dart';

void main() {
  final tBookModel = BookModel(
    id: '123',
    title: 'Test',
    description: null,
    publishedAt: DateTime(2022, 10, 23),
    authorModel: AuthorModel(id: '123', name: 'Test', surname: 'Author'),
    genreModel: GenreModel(id: '123', name: 'Test'),
  );

  test(
    'should be a subclass of Book entity',
    () async {
      // assert
      expect(tBookModel, isA<Book>());
    },
  );
}
