import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/features/books/data/models/author_model.dart';
import 'package:mobile/features/books/data/models/book_model.dart';
import 'package:mobile/features/books/data/models/genre_model.dart';
import 'package:mobile/features/books/data/repositories/books_repository_impl.dart';
import 'package:mobile/features/books/data/sources/books_api.dart';
import 'package:mobile/features/books/domain/repositories/books_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<BooksRepository>(), MockSpec<BooksApi>()])
import 'books_repository_impl_test.mocks.dart';

void main() {
  late BooksRepositoryImpl repository;
  late MockBooksApi mockBooksApi;

  setUp(() {
    mockBooksApi = MockBooksApi();
    repository = BooksRepositoryImpl(booksApi: mockBooksApi);
  });

  const tBookId = '123';
  const tTitleOrAuthor = 'Test';
  final tBookModel = BookModel(
    id: tBookId,
    title: 'Test',
    description: null,
    publishedAt: DateTime(2022, 10, 23),
    authorModel: AuthorModel(id: '123', name: 'Test', surname: 'Author'),
    genreModel: GenreModel(id: '123', name: 'Test'),
  );
  final tBookModels = [
    tBookModel,
  ];

  test('should call an API to get book by Id', () async {
    // arrange
    when(mockBooksApi.getBookById(tBookId)).thenAnswer((_) async => tBookModel);
    // act
    final result = await repository.getBookById(tBookId);
    // assert
    verify(mockBooksApi.getBookById(tBookId));
    expect(result, Right(tBookModel));
    verifyNoMoreInteractions(mockBooksApi);
  });

  test('should call an API to get all books if title or author not provided',
      () async {
    // arrange
    when(mockBooksApi.getAllBooks()).thenAnswer((_) async => tBookModels);
    // act
    final result = await repository.getBooks();
    // assert
    verify(mockBooksApi.getAllBooks());
    expect(result, Right(tBookModels));
    verifyNoMoreInteractions(mockBooksApi);
  });

  test('should call an API to get filtered books if title or author provided',
      () async {
    // arrange
    when(mockBooksApi.getBooksByTitleOrAuthor(tTitleOrAuthor))
        .thenAnswer((_) async => tBookModels);
    // act
    final result = await repository.getBooks(tTitleOrAuthor);
    // assert
    verify(mockBooksApi.getBooksByTitleOrAuthor(tTitleOrAuthor));
    expect(result, Right(tBookModels));
    verifyNoMoreInteractions(mockBooksApi);
  });
}
