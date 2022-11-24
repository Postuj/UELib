import 'package:injectable/injectable.dart';
import 'package:mobile/core/data/factories/entity_factory.dart';
import 'package:mobile/features/books/data/models/borrowed_book_dto.dart';
import 'package:mobile/features/books/domain/entities/borrowed_book.dart';

import 'author_entity_factory.dart';
import 'genre_entity_factory.dart';

@injectable
class BorrowedBookEntityFactory
    extends EntityFactory<BorrowedBook, BorrowedBookDto> {
  final AuthorEntityFactory _authorEntityFactory;
  final GenreEntityFactory _genreEntityFactory;

  BorrowedBookEntityFactory({
    required AuthorEntityFactory authorEntityFactory,
    required GenreEntityFactory genreEntityFactory,
  })  : _authorEntityFactory = authorEntityFactory,
        _genreEntityFactory = genreEntityFactory;

  @override
  BorrowedBook fromDto(BorrowedBookDto dto) => BorrowedBook(
        id: dto.id,
        title: dto.title,
        description: dto.description,
        publishedAt: dto.publishedAt,
        author: _authorEntityFactory.fromDto(dto.authorDto),
        genre: _genreEntityFactory.fromDto(dto.genreDto),
        borrowedAt: dto.borrowedAt,
        returnedAt: dto.returnedAt,
        plannedDateOfReturn: dto.plannedDateOfReturn,
      );
}
