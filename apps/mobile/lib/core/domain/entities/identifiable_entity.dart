import 'package:mobile/core/domain/entities/entity.dart';

abstract class IdentifiableEntity extends Entity {
  final String id;

  IdentifiableEntity(this.id);

  @override
  List<Object?> get props => [id];
}
