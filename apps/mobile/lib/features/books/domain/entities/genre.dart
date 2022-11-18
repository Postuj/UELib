import 'package:mobile/core/domain/entities/identifiable_entity.dart';

class Genre extends IdentifiableEntity {
  final String name;

  Genre({required String id, required this.name}) : super(id);

  @override
  List<Object?> get props => [id, name];
}
