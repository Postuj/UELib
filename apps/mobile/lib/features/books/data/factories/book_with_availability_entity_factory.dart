import 'package:injectable/injectable.dart';
import 'package:mobile/core/data/factories/entity_factory.dart';
import 'package:mobile/features/books/data/factories/author_entity_factory.dart';
import 'package:mobile/features/books/data/factories/genre_entity_factory.dart';
import 'package:mobile/features/books/data/models/book_with_availability_dto.dart';
import 'package:mobile/features/books/domain/entities/book_with_availability.dart';

@injectable
class BookWithAvailabilityEntityFactory
    extends EntityFactory<BookWithAvailability, BookWithAvailabilityDto> {
  final AuthorEntityFactory _authorEntityFactory;
  final GenreEntityFactory _genreEntityFactory;

  BookWithAvailabilityEntityFactory({
    required AuthorEntityFactory authorEntityFactory,
    required GenreEntityFactory genreEntityFactory,
  })  : _authorEntityFactory = authorEntityFactory,
        _genreEntityFactory = genreEntityFactory;

  @override
  BookWithAvailability fromDto(BookWithAvailabilityDto dto) =>
      BookWithAvailability(
        id: dto.id,
        title: dto.title,
        description: dto.description,
        publishedAt: dto.publishedAt,
        author: _authorEntityFactory.fromDto(dto.authorDto),
        genre: _genreEntityFactory.fromDto(dto.genreDto),
        isAvailable: dto.isAvailable,
        plannedDateOfReturn: dto.plannedDateOfReturn,
      );
}
