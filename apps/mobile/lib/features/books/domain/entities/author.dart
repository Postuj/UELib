import 'package:equatable/equatable.dart';
import 'package:mobile/core/domain/entities/identifiable_entity.dart';

class Author extends IdentifiableEntity with EquatableMixin {
  final String name;
  final String surname;

  Author({
    required String id,
    required this.name,
    required this.surname,
  }) : super(id);

  @override
  List<Object> get props => [id, name, surname];
}
