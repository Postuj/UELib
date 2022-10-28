import 'package:mobile/features/books/domain/entities/genre.dart';

class GenreModel extends Genre {
  GenreModel({
    required String id,
    required String name,
  }) : super(id: id, name: name);
}
