import 'package:mobile/core/data/factories/model_factory.dart';
import 'package:mobile/features/books/data/factories/genre_model_factory.dart';
import 'package:mobile/features/books/data/models/book_model.dart';

import 'author_model_factory.dart';

class BookModelFactory implements ModelFactory<BookModel> {
  late AuthorModelFactory _authorModelFactory;
  late GenreModelFactory _genreModelFactory;

  BookModelFactory({
    required AuthorModelFactory authorModelFactory,
    required GenreModelFactory genreModelFactory,
  }) {
    _authorModelFactory = authorModelFactory;
    _genreModelFactory = genreModelFactory;
  }

  @override
  BookModel fromJson(Map<String, dynamic> json) => BookModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        publishedAt: DateTime.parse(json['publishedDate']),
        authorModel: _authorModelFactory.fromJson(json['author']),
        genreModel: _genreModelFactory.fromJson(json['genre']),
      );
}
