import 'package:mobile/core/domain/entities/base_entity.dart';

abstract class IdentifiableEntity extends BaseEntity {
  final String id;

  IdentifiableEntity(this.id);
}
