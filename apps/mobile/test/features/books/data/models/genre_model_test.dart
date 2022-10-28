import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/features/books/data/models/genre_model.dart';
import 'package:mobile/features/books/domain/entities/genre.dart';

void main() {
  final tGenreModel = GenreModel(id: '123', name: 'Test');

  test(
    'should be a subclass of Genre entity',
    () async {
      // assert
      expect(tGenreModel, isA<Genre>());
    },
  );
}
