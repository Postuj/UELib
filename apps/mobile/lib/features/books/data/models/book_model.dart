import 'package:mobile/features/books/data/models/author_model.dart';
import 'package:mobile/features/books/data/models/genre_model.dart';
import 'package:mobile/features/books/domain/entities/book.dart';

class BookModel extends Book {
  BookModel({
    required String id,
    required String title,
    required String? description,
    required DateTime publishedAt,
    required AuthorModel authorModel,
    required GenreModel genreModel,
  }) : super(
          id: id,
          title: title,
          description: description,
          publishedAt: publishedAt,
          author: authorModel,
          genre: genreModel,
        );
}
