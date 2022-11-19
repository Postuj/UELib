import 'package:mobile/features/books/domain/entities/author.dart';
import 'package:mobile/features/books/domain/entities/book.dart';
import 'package:mobile/features/books/domain/entities/genre.dart';

class BookWithAvailability extends Book {
  final bool isAvailable;
  final DateTime? plannedDateOfReturn;

  BookWithAvailability({
    required this.isAvailable,
    required this.plannedDateOfReturn,
    required String id,
    required String title,
    required String? description,
    required DateTime publishedAt,
    required Author author,
    required Genre genre,
  }) : super(
          id: id,
          title: title,
          description: description,
          publishedAt: publishedAt,
          author: author,
          genre: genre,
        );

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        publishedAt,
        author,
        genre,
        isAvailable,
        plannedDateOfReturn
      ];
}
