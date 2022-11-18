import 'package:mobile/core/data/models/dto.dart';
import 'package:mobile/core/domain/entities/entity.dart';

abstract class EntityFactory<TEntity extends Entity, TDto extends Dto> {
  TEntity fromDto(TDto dto);
}
