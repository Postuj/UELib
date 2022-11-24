// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i10;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mobile/core/di/app_module.dart' as _i37;
import 'package:mobile/core/presentation/router/router.dart' as _i3;
import 'package:mobile/features/auth/data/factories/auth_credentials_entity_factory.dart'
    as _i4;
import 'package:mobile/features/auth/data/services/auth_service_impl.dart'
    as _i24;
import 'package:mobile/features/auth/data/sources/auth_api.dart' as _i21;
import 'package:mobile/features/auth/data/sources/interceptors/auth_interceptor.dart'
    as _i23;
import 'package:mobile/features/auth/di/auth_module.dart' as _i38;
import 'package:mobile/features/auth/domain/services/auth_service.dart' as _i5;
import 'package:mobile/features/auth/domain/usecases/log_in_usecase.dart'
    as _i18;
import 'package:mobile/features/auth/domain/usecases/log_out_usecase.dart'
    as _i19;
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart' as _i22;
import 'package:mobile/features/auth/presentation/router/route_auth_guard.dart'
    as _i20;
import 'package:mobile/features/books/data/factories/author_entity_factory.dart'
    as _i6;
import 'package:mobile/features/books/data/factories/book_entity_factory.dart'
    as _i25;
import 'package:mobile/features/books/data/factories/book_with_availability_entity_factory.dart'
    as _i26;
import 'package:mobile/features/books/data/factories/borrowed_book_entity_factory.dart'
    as _i30;
import 'package:mobile/features/books/data/factories/genre_entity_factory.dart'
    as _i12;
import 'package:mobile/features/books/data/repositories/books_repository_impl.dart'
    as _i32;
import 'package:mobile/features/books/data/sources/books_api.dart' as _i27;
import 'package:mobile/features/books/domain/repositories/books_repository.dart'
    as _i7;
import 'package:mobile/features/books/domain/usecases/get_book_by_id_usecase.dart'
    as _i13;
import 'package:mobile/features/books/domain/usecases/get_book_with_availability_usecase.dart'
    as _i14;
import 'package:mobile/features/books/domain/usecases/get_books_by_title_or_author_usecase.dart'
    as _i15;
import 'package:mobile/features/books/domain/usecases/get_borrowing_history_usecase.dart'
    as _i16;
import 'package:mobile/features/books/domain/usecases/get_currently_borrowed_books_usecase.dart'
    as _i17;
import 'package:mobile/features/books/presentation/blocs/borrowing_history/borrowing_history_bloc.dart'
    as _i31;
import 'package:mobile/features/books/presentation/blocs/currently_borrowed/currently_borrowed_bloc.dart'
    as _i9;
import 'package:mobile/features/books_search/presentation/bloc/books_search_bloc.dart'
    as _i28;
import 'package:mobile/features/borrow_book/presentation/bloc/borrow_book_bloc.dart'
    as _i29;
import 'package:mobile/features/borrow_book/usecases/borrow_book_usecase.dart'
    as _i8;

import '../../features/auth/di/auth_test_module.dart' as _i34;
import '../../features/books/di/books_test_module.dart' as _i35;
import '../../features/borrow_book/di/borrow_book_test_module.dart' as _i36;
import 'test_module.dart' as _i33;

const String _test = 'test';
const String _dev = 'dev';
const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final testModule = _$TestModule();
  final authTestModule = _$AuthTestModule();
  final booksTestModule = _$BooksTestModule();
  final borrowBookTestModule = _$BorrowBookTestModule();
  final appModule = _$AppModule();
  final authModule = _$AuthModule();
  gh.factory<_i3.AppRouter>(
    () => testModule.router,
    registerFor: {_test},
  );
  gh.factory<_i4.AuthCredentialsEntityFactory>(
      () => _i4.AuthCredentialsEntityFactory());
  gh.factory<_i5.AuthService>(
    () => authTestModule.authService,
    registerFor: {_test},
  );
  gh.factory<_i6.AuthorEntityFactory>(() => _i6.AuthorEntityFactory());
  gh.factory<_i7.BooksRepository>(
    () => booksTestModule.booksRepository,
    registerFor: {_test},
  );
  gh.factory<_i8.BorrowBookUsecase>(
    () => borrowBookTestModule.getBorrowBookUsecase,
    registerFor: {_test},
  );
  gh.factory<_i9.CurrentlyBorrowedBloc>(
    () => booksTestModule.currentlyBorrowedBloc,
    registerFor: {_test},
  );
  gh.singleton<_i10.Dio>(
    appModule.dio,
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i10.Dio>(
    () => testModule.dio,
    registerFor: {_test},
  );
  gh.factory<_i11.FlutterSecureStorage>(
    () => authTestModule.secureStorage,
    registerFor: {_test},
  );
  gh.singleton<_i11.FlutterSecureStorage>(
    authModule.storage,
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i12.GenreEntityFactory>(() => _i12.GenreEntityFactory());
  gh.factory<_i13.GetBookByIdUsecase>(
    () => booksTestModule.getBookByIdUsecase,
    registerFor: {_test},
  );
  gh.factory<_i14.GetBookWithAvailabilityUsecase>(
    () => booksTestModule.getBookWithAvailabilityUsecase,
    registerFor: {_test},
  );
  gh.factory<_i15.GetBooksByTitleOrAuthorUsecase>(
    () => booksTestModule.getBooksByTitleOrAuthorUsecase,
    registerFor: {_test},
  );
  gh.factory<_i16.GetBorrowingHistoryUsecase>(
    () => booksTestModule.getBorrowingHistoryUsecase,
    registerFor: {_test},
  );
  gh.factory<_i17.GetCurrentlyBorrowedBooksUsecase>(
    () => booksTestModule.getCurrentlyBorrowedBooksUsecase,
    registerFor: {_test},
  );
  gh.factory<_i18.LogInUsecase>(
    () => authTestModule.logInUsecase,
    registerFor: {_test},
  );
  gh.factory<_i19.LogOutUsecase>(
    () => authTestModule.logOutUsecase,
    registerFor: {_test},
  );
  gh.factory<_i20.RouteAuthGuard>(
      () => _i20.RouteAuthGuard(authService: get<_i5.AuthService>()));
  gh.singleton<_i3.AppRouter>(
    _i3.AppRouter(routeAuthGuard: get<_i20.RouteAuthGuard>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i21.AuthApi>(() => _i21.AuthApi.create(get<_i10.Dio>()));
  gh.factory<_i22.AuthBloc>(() => _i22.AuthBloc(
        logIn: get<_i18.LogInUsecase>(),
        logOut: get<_i19.LogOutUsecase>(),
        router: get<_i3.AppRouter>(),
      ));
  gh.factory<_i23.AuthInterceptor>(
      () => _i23.AuthInterceptor(authService: get<_i5.AuthService>()));
  gh.factory<_i5.AuthService>(
    () => _i24.AuthServiceImpl(
      authApi: get<_i21.AuthApi>(),
      storage: get<_i11.FlutterSecureStorage>(),
      authCredentialsEntityFactory: get<_i4.AuthCredentialsEntityFactory>(),
    ),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i25.BookEntityFactory>(() => _i25.BookEntityFactory(
        authorEntityFactory: get<_i6.AuthorEntityFactory>(),
        genreEntityFactory: get<_i12.GenreEntityFactory>(),
      ));
  gh.factory<_i26.BookWithAvailabilityEntityFactory>(
      () => _i26.BookWithAvailabilityEntityFactory(
            authorEntityFactory: get<_i6.AuthorEntityFactory>(),
            genreEntityFactory: get<_i12.GenreEntityFactory>(),
          ));
  gh.factory<_i27.BooksApi>(() => _i27.BooksApi.create(get<_i10.Dio>()));
  gh.factory<_i28.BooksSearchBloc>(() => _i28.BooksSearchBloc(
        getBookById: get<_i13.GetBookByIdUsecase>(),
        getBooksByTitleOrAuthor: get<_i15.GetBooksByTitleOrAuthorUsecase>(),
      ));
  gh.factory<_i29.BorrowBookBloc>(() => _i29.BorrowBookBloc(
        getBookWithAvailabilityUsecase:
            get<_i14.GetBookWithAvailabilityUsecase>(),
        borrowBookUsecase: get<_i8.BorrowBookUsecase>(),
        currentlyBorrowedBloc: get<_i9.CurrentlyBorrowedBloc>(),
      ));
  gh.factory<_i30.BorrowedBookEntityFactory>(
      () => _i30.BorrowedBookEntityFactory(
            authorEntityFactory: get<_i6.AuthorEntityFactory>(),
            genreEntityFactory: get<_i12.GenreEntityFactory>(),
          ));
  gh.factory<_i31.BorrowingHistoryBloc>(() => _i31.BorrowingHistoryBloc(
      getBorrowingHistoryUsecase: get<_i16.GetBorrowingHistoryUsecase>()));
  gh.factory<_i18.LogInUsecase>(
    () => _i18.LogInUsecase(authService: get<_i5.AuthService>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i19.LogOutUsecase>(
    () => _i19.LogOutUsecase(authService: get<_i5.AuthService>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i7.BooksRepository>(
    () => _i32.BooksRepositoryImpl(
      booksApi: get<_i27.BooksApi>(),
      bookEntityFactory: get<_i25.BookEntityFactory>(),
      borrowedBookEntityFactory: get<_i30.BorrowedBookEntityFactory>(),
      bookEntityWithAvailabilityFactory:
          get<_i26.BookWithAvailabilityEntityFactory>(),
    ),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i8.BorrowBookUsecase>(
    () => _i8.BorrowBookUsecase(booksRepository: get<_i7.BooksRepository>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i13.GetBookByIdUsecase>(
    () => _i13.GetBookByIdUsecase(repository: get<_i7.BooksRepository>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i14.GetBookWithAvailabilityUsecase>(
    () => _i14.GetBookWithAvailabilityUsecase(
        repository: get<_i7.BooksRepository>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i15.GetBooksByTitleOrAuthorUsecase>(
    () => _i15.GetBooksByTitleOrAuthorUsecase(
        repository: get<_i7.BooksRepository>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i16.GetBorrowingHistoryUsecase>(
    () =>
        _i16.GetBorrowingHistoryUsecase(repository: get<_i7.BooksRepository>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i17.GetCurrentlyBorrowedBooksUsecase>(
    () => _i17.GetCurrentlyBorrowedBooksUsecase(
        repository: get<_i7.BooksRepository>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.singleton<_i9.CurrentlyBorrowedBloc>(
    _i9.CurrentlyBorrowedBloc(
        getCurrentlyBorrowedBooksUsecase:
            get<_i17.GetCurrentlyBorrowedBooksUsecase>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  return get;
}

class _$TestModule extends _i33.TestModule {}

class _$AuthTestModule extends _i34.AuthTestModule {}

class _$BooksTestModule extends _i35.BooksTestModule {}

class _$BorrowBookTestModule extends _i36.BorrowBookTestModule {}

class _$AppModule extends _i37.AppModule {}

class _$AuthModule extends _i38.AuthModule {}
