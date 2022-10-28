import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/core/error/exception.dart';
import 'package:mobile/features/books/data/factories/author_model_factory.dart';
import 'package:mobile/features/books/data/factories/book_model_factory.dart';
import 'package:mobile/features/books/data/factories/genre_model_factory.dart';
import 'package:mobile/features/books/data/models/author_model.dart';
import 'package:mobile/features/books/data/models/book_model.dart';
import 'package:mobile/features/books/data/models/genre_model.dart';
import 'package:mobile/features/books/data/sources/books_api.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';
@GenerateNiceMocks([MockSpec<http.Client>()])
import 'books_api_test.mocks.dart';

void main() {
  late MockClient mockHttpClient;
  late BooksApi booksApi;

  void setUpMockHttpClientSuccess200() {
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
      (_) async => http.Response(fixture('book.json'), 200),
    );
  }

  void setUpMockHttpClientFailure404() {
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
      (_) async => http.Response('Something went wrong', 404),
    );
  }

  setUp(() {
    mockHttpClient = MockClient();
    booksApi = BooksApiImpl(
      client: mockHttpClient,
      bookModelFactory: BookModelFactory(
        authorModelFactory: AuthorModelFactory(),
        genreModelFactory: GenreModelFactory(),
      ),
    );
  });

  const headers = {'Content-Type': 'applications/json'};

  group('getBooks', () {
    const tBookId = '123';
    final tGetBookByIdUrl = Uri.parse('http://localhost:3000/books/$tBookId');
    final tBookModel = BookModel(
      id: tBookId,
      title: 'Test',
      description: null,
      publishedAt: DateTime(2022, 10, 23),
      authorModel: AuthorModel(id: '123', name: 'Test', surname: 'Author'),
      genreModel: GenreModel(id: '123', name: 'Test'),
    );

    group('GET book by id', () {
      test('should return a book when response 200', () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        final result = await booksApi.getBookById(tBookId);
        // assert
        verify(mockHttpClient.get(tGetBookByIdUrl, headers: headers));
        expect(result, tBookModel);
        verifyNoMoreInteractions(mockHttpClient);
      });

      test('should throw a ServerException when the response is not 200',
          () async {
        // arrange
        setUpMockHttpClientFailure404();
        // act
        final call = booksApi.getBookById;
        // assert
        expect(
            () => call(tBookId), throwsA(const TypeMatcher<ServerException>()));
      });
    });
  });
}
