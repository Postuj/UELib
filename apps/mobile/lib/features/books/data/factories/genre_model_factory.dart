import 'package:mobile/core/data/factories/model_factory.dart';
import 'package:mobile/features/books/data/models/genre_model.dart';

class GenreModelFactory implements ModelFactory<GenreModel> {
  @override
  GenreModel fromJson(Map<String, dynamic> json) =>
      GenreModel(id: json['id'], name: json['name']);
}
