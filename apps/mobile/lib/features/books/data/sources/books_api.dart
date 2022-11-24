import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/features/books/data/models/book_dto.dart';
import 'package:mobile/features/books/data/sources/requests/borrow_book_request.dart';
import 'package:retrofit/http.dart';

import '../../../../core/data/sources/env.dart';
import '../models/book_with_availability_dto.dart';
import '../models/borrowed_book_dto.dart';

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

  @GET('/currently-borrowed')
  Future<List<BorrowedBookDto>> getCurrentlyBorrowedBooks();

  @GET('/borrowing-history')
  Future<List<BorrowedBookDto>> getBorrowingHistory();

  @GET('/{id}/with-availability')
  Future<BookWithAvailabilityDto> getBookWithAvailabilityById(
      @Path('id') String id);

  @POST('/{id}/borrow')
  Future<void> borrowBook(
      @Path('id') String id, @Body() BorrowBookRequest request);
}
