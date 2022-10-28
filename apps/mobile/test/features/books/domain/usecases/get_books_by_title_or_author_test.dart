import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/features/books/domain/entities/author.dart';
import 'package:mobile/features/books/domain/entities/book.dart';
import 'package:mobile/features/books/domain/entities/genre.dart';
import 'package:mobile/features/books/domain/usecases/get_books_by_title_or_author.dart';
import 'package:mockito/mockito.dart';

import '../repositories/books_repository_impl_test.mocks.dart';

void main() {
  late GetBooksByTitleOrAuthor usecase;
  late MockBooksRepository mockBooksRepository;

  setUp(() {
    mockBooksRepository = MockBooksRepository();
    usecase = GetBooksByTitleOrAuthor(repository: mockBooksRepository);
  });

  const tTitleOrAuthor = 'Test';
  final List<Book> tBooks = [
    Book(
      id: '123',
      title: 'Test',
      description: null,
      publishedAt: DateTime(2022, 10, 23),
      author: Author(id: '1', name: 'John', surname: 'Doe'),
      genre: Genre(id: '1', name: 'Test'),
    ),
    Book(
      id: '123',
      title: 'Second',
      description: null,
      publishedAt: DateTime(2022, 10, 23),
      author: Author(id: '1', name: 'John', surname: 'Doe'),
      genre: Genre(id: '1', name: 'Second'),
    ),
  ];
  final List<Book> tBooksFiltered = [
    Book(
      id: '123',
      title: 'Test',
      description: null,
      publishedAt: DateTime(2022, 10, 23),
      author: Author(id: '1', name: 'John', surname: 'Doe'),
      genre: Genre(id: '1', name: 'Test'),
    ),
  ];

  test('should get all books', () async {
    // arrange
    when(mockBooksRepository.getBooks()).thenAnswer((_) async => Right(tBooks));
    // act
    final result = await usecase.call(const Params());
    // assert
    expect(result, Right(tBooks));
    verify(mockBooksRepository.getBooks());
    verifyNoMoreInteractions(mockBooksRepository);
  });

  test('should get books by title or author', () async {
    // arrange
    when(mockBooksRepository.getBooks(tTitleOrAuthor))
        .thenAnswer((_) async => Right(tBooksFiltered));
    // act
    final result =
        await usecase.call(const Params(titleOrAuthor: tTitleOrAuthor));
    // assert
    expect(result, Right(tBooksFiltered));
    verify(mockBooksRepository.getBooks(tTitleOrAuthor));
    verifyNoMoreInteractions(mockBooksRepository);
  });
}
