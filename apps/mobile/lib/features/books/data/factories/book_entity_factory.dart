import 'package:injectable/injectable.dart';
import 'package:mobile/core/data/factories/entity_factory.dart';
import 'package:mobile/features/books/data/factories/author_entity_factory.dart';
import 'package:mobile/features/books/data/factories/genre_entity_factory.dart';
import 'package:mobile/features/books/data/models/book_dto.dart';
import 'package:mobile/features/books/domain/entities/book.dart';

@injectable
class BookEntityFactory extends EntityFactory<Book, BookDto> {
  final AuthorEntityFactory _authorEntityFactory;
  final GenreEntityFactory _genreEntityFactory;

  BookEntityFactory({
    required AuthorEntityFactory authorEntityFactory,
    required GenreEntityFactory genreEntityFactory,
  })  : _authorEntityFactory = authorEntityFactory,
        _genreEntityFactory = genreEntityFactory;
  @override
  Book fromDto(BookDto dto) => Book(
      id: dto.id,
      title: dto.title,
      description: dto.description,
      publishedAt: dto.publishedAt,
      author: _authorEntityFactory.fromDto(dto.authorDto),
      genre: _genreEntityFactory.fromDto(dto.genreDto));
}
