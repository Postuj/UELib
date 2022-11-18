import 'package:injectable/injectable.dart';
import 'package:mobile/core/data/factories/entity_factory.dart';
import 'package:mobile/features/books/data/models/author_dto.dart';
import 'package:mobile/features/books/domain/entities/author.dart';

@injectable
class AuthorEntityFactory extends EntityFactory<Author, AuthorDto> {
  @override
  Author fromDto(AuthorDto dto) =>
      Author(id: dto.id, name: dto.name, surname: dto.surname);
}
