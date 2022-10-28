import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile/core/data/sources/base_api.dart';
import 'package:mobile/core/error/exception.dart';
import 'package:mobile/features/books/data/factories/book_model_factory.dart';
import 'package:mobile/features/books/data/models/book_model.dart';

abstract class BooksApi {
  Future<BookModel> getBookById(String id);
  Future<List<BookModel>> getAllBooks();
  Future<List<BookModel>> getBooksByTitleOrAuthor(String titleOrAuthor);
}

class BooksApiImpl extends BaseApi<BookModel, BookModelFactory>
    implements BooksApi {
  BooksApiImpl(
      {required http.Client client, required BookModelFactory bookModelFactory})
      : super(
            client: client, modelFactory: bookModelFactory, basePath: 'books');

  @override
  Future<List<BookModel>> getAllBooks() async {
    return getManyFromPath('');
  }

  @override
  Future<BookModel> getBookById(String id) async {
    return getOneFromPath(id);
  }

  @override
  Future<List<BookModel>> getBooksByTitleOrAuthor(String titleOrAuthor) async {
    return getManyFromPath('?titleOrAuthor=$titleOrAuthor');
  }
}
