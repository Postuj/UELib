import 'package:mobile/features/books/domain/entities/book.dart';

import 'author.dart';
import 'genre.dart';

class BorrowedBook extends Book {
  final DateTime borrowedAt;
  final DateTime plannedDateOfReturn;
  final DateTime? returnedAt;

  BorrowedBook({
    required this.borrowedAt,
    required this.returnedAt,
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
        borrowedAt,
        returnedAt,
        plannedDateOfReturn
      ];
}
