// Mocks generated by Mockito 5.3.2 from annotations
// in mobile/test/features/books/di/books_test_module.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mobile/core/error/failure.dart' as _i5;
import 'package:mobile/features/books/domain/entities/book.dart' as _i6;
import 'package:mobile/features/books/domain/repositories/books_repository.dart'
    as _i3;
import 'package:mobile/features/books/domain/usecases/get_book_by_id_usecase.dart'
    as _i8;
import 'package:mobile/features/books/domain/usecases/get_books_by_title_or_author_usecase.dart'
    as _i7;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeBooksRepository_1 extends _i1.SmartFake
    implements _i3.BooksRepository {
  _FakeBooksRepository_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [BooksRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockBooksRepository extends _i1.Mock implements _i3.BooksRepository {
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Book>> getBookById(String? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getBookById,
          [id],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i6.Book>>.value(
            _FakeEither_0<_i5.Failure, _i6.Book>(
          this,
          Invocation.method(
            #getBookById,
            [id],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, _i6.Book>>.value(
                _FakeEither_0<_i5.Failure, _i6.Book>(
          this,
          Invocation.method(
            #getBookById,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.Book>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Book>>> getBooks(
          {String? titleOrAuthor}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getBooks,
          [],
          {#titleOrAuthor: titleOrAuthor},
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, List<_i6.Book>>>.value(
            _FakeEither_0<_i5.Failure, List<_i6.Book>>(
          this,
          Invocation.method(
            #getBooks,
            [],
            {#titleOrAuthor: titleOrAuthor},
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.Book>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.Book>>(
          this,
          Invocation.method(
            #getBooks,
            [],
            {#titleOrAuthor: titleOrAuthor},
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Book>>>);
}

/// A class which mocks [GetBooksByTitleOrAuthorUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetBooksByTitleOrAuthorUsecase extends _i1.Mock
    implements _i7.GetBooksByTitleOrAuthorUsecase {
  @override
  _i3.BooksRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeBooksRepository_1(
          this,
          Invocation.getter(#repository),
        ),
        returnValueForMissingStub: _FakeBooksRepository_1(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i3.BooksRepository);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Book>>> call(
          _i7.GetBooksByTitleOrAuthorParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, List<_i6.Book>>>.value(
            _FakeEither_0<_i5.Failure, List<_i6.Book>>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.Book>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.Book>>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Book>>>);
}

/// A class which mocks [GetBookByIdUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetBookByIdUsecase extends _i1.Mock
    implements _i8.GetBookByIdUsecase {
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Book>> call(
          _i8.GetBookByIdParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [params],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i6.Book>>.value(
            _FakeEither_0<_i5.Failure, _i6.Book>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, _i6.Book>>.value(
                _FakeEither_0<_i5.Failure, _i6.Book>(
          this,
          Invocation.method(
            #call,
            [params],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.Book>>);
}
