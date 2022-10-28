import 'package:mobile/core/domain/entities/base_entity.dart';

abstract class EntityFactory<TEntity extends BaseEntity, TModel> {
  TEntity fromModel(TModel model);
}
