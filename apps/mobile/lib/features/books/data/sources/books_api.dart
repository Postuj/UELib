import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/features/books/data/models/book_dto.dart';
import 'package:retrofit/http.dart';

import '../../../../core/data/sources/env.dart';

part 'books_api.g.dart';

@injectable
@RestApi(baseUrl: 'http://localhost:3000/books')
abstract class BooksApi {
  @factoryMethod
  static BooksApi create(Dio dio) =>
      _BooksApi(dio, baseUrl: '${Env.apiUrl}/books');

  factory BooksApi(Dio dio) => _BooksApi(dio);

  @GET('/{id}')
  Future<BookDto> getBookById(@Path() String id);

  @GET('')
  Future<List<BookDto>> getAllBooks();

  @GET('')
  Future<List<BookDto>> getBooksByTitleOrAuthor(
    @Query('titleOrAuthor') String titleOrAuthor,
  );
}