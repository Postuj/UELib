import 'package:equatable/equatable.dart';
import 'package:mobile/core/domain/entities/identifiable_entity.dart';

import 'author.dart';
import 'genre.dart';

class Book extends IdentifiableEntity with EquatableMixin {
  final String title;
  final String? description;
  final DateTime publishedAt;
  final Author author;
  final Genre genre;

  Book({
    required String id,
    required this.title,
    required this.description,
    required this.publishedAt,
    required this.author,
    required this.genre,
  }) : super(id);

  @override
  List<Object?> get props =>
      [id, title, description, publishedAt, author, genre];
}
