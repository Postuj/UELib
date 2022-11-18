import 'package:mobile/core/domain/entities/identifiable_entity.dart';

class User extends IdentifiableEntity {
  final String email;

  User({required String id, required this.email}) : super(id);

  @override
  List<Object?> get props => [id, email];
}
