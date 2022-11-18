import 'package:injectable/injectable.dart';
import 'package:mobile/core/data/factories/entity_factory.dart';
import 'package:mobile/features/books/data/models/genre_dto.dart';
import 'package:mobile/features/books/domain/entities/genre.dart';

@injectable
class GenreEntityFactory extends EntityFactory<Genre, GenreDto> {
  @override
  Genre fromDto(GenreDto dto) => Genre(id: dto.id, name: dto.name);
}
