import 'package:mobile/features/books/data/models/author_model.dart';

import '../../../../core/data/factories/model_factory.dart';

class AuthorModelFactory implements ModelFactory<AuthorModel> {
  @override
  AuthorModel fromJson(Map<String, dynamic> json) =>
      AuthorModel(id: json['id'], name: json['name'], surname: json['surname']);
}
