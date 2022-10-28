import 'package:mobile/features/books/domain/entities/author.dart';

class AuthorModel extends Author {
  AuthorModel({
    required String id,
    required String name,
    required String surname,
  }) : super(id: id, name: name, surname: surname);
}
