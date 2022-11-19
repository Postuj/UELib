// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i8;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mobile/core/di/app_module.dart' as _i29;
import 'package:mobile/core/presentation/router/router.dart' as _i3;
import 'package:mobile/features/auth/data/factories/auth_credentials_entity_factory.dart'
    as _i4;
import 'package:mobile/features/auth/data/services/auth_service_impl.dart'
    as _i20;
import 'package:mobile/features/auth/data/sources/auth_api.dart' as _i17;
import 'package:mobile/features/auth/data/sources/interceptors/auth_interceptor.dart'
    as _i19;
import 'package:mobile/features/auth/di/auth_module.dart' as _i30;
import 'package:mobile/features/auth/domain/services/auth_service.dart' as _i5;
import 'package:mobile/features/auth/domain/usecases/log_in_usecase.dart'
    as _i14;
import 'package:mobile/features/auth/domain/usecases/log_out_usecase.dart'
    as _i15;
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart' as _i18;
import 'package:mobile/features/auth/presentation/router/route_auth_guard.dart'
    as _i16;
import 'package:mobile/features/books/data/factories/author_entity_factory.dart'
    as _i6;
import 'package:mobile/features/books/data/factories/book_entity_factory.dart'
    as _i21;
import 'package:mobile/features/books/data/factories/book_with_availability_entity_factory.dart'
    as _i22;
import 'package:mobile/features/books/data/factories/genre_entity_factory.dart'
    as _i10;
import 'package:mobile/features/books/data/repositories/books_repository_impl.dart'
    as _i24;
import 'package:mobile/features/books/data/sources/books_api.dart' as _i23;
import 'package:mobile/features/books/domain/repositories/books_repository.dart'
    as _i7;
import 'package:mobile/features/books/domain/usecases/get_book_by_id_usecase.dart'
    as _i11;
import 'package:mobile/features/books/domain/usecases/get_book_with_availability_usecase.dart'
    as _i12;
import 'package:mobile/features/books/domain/usecases/get_books_by_title_or_author_usecase.dart'
    as _i13;
import 'package:mobile/features/books_search/presentation/bloc/books_search_bloc.dart'
    as _i25;

import '../../features/auth/di/auth_test_module.dart' as _i27;
import '../../features/books/di/books_test_module.dart' as _i28;
import 'test_module.dart' as _i26;

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
  gh.singleton<_i8.Dio>(
    appModule.dio,
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i8.Dio>(
    () => testModule.dio,
    registerFor: {_test},
  );
  gh.singleton<_i9.FlutterSecureStorage>(
    authModule.storage,
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i9.FlutterSecureStorage>(
    () => authTestModule.secureStorage,
    registerFor: {_test},
  );
  gh.factory<_i10.GenreEntityFactory>(() => _i10.GenreEntityFactory());
  gh.factory<_i11.GetBookByIdUsecase>(
    () => booksTestModule.getBookByIdUsecase,
    registerFor: {_test},
  );
  gh.factory<_i12.GetBookWithAvailabilityUsecase>(
    () => booksTestModule.getBookWithAvailabilityUsecase,
    registerFor: {_test},
  );
  gh.factory<_i13.GetBooksByTitleOrAuthorUsecase>(
    () => booksTestModule.getBooksByTitleOrAuthorUsecase,
    registerFor: {_test},
  );
  gh.factory<_i14.LogInUsecase>(
    () => authTestModule.logInUsecase,
    registerFor: {_test},
  );
  gh.factory<_i15.LogOutUsecase>(
    () => authTestModule.logOutUsecase,
    registerFor: {_test},
  );
  gh.factory<_i16.RouteAuthGuard>(
      () => _i16.RouteAuthGuard(authService: get<_i5.AuthService>()));
  gh.singleton<_i3.AppRouter>(
    _i3.AppRouter(routeAuthGuard: get<_i16.RouteAuthGuard>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i17.AuthApi>(() => _i17.AuthApi.create(get<_i8.Dio>()));
  gh.factory<_i18.AuthBloc>(() => _i18.AuthBloc(
        logIn: get<_i14.LogInUsecase>(),
        logOut: get<_i15.LogOutUsecase>(),
        router: get<_i3.AppRouter>(),
      ));
  gh.factory<_i19.AuthInterceptor>(
      () => _i19.AuthInterceptor(authService: get<_i5.AuthService>()));
  gh.factory<_i5.AuthService>(
    () => _i20.AuthServiceImpl(
      authApi: get<_i17.AuthApi>(),
      storage: get<_i9.FlutterSecureStorage>(),
      authCredentialsEntityFactory: get<_i4.AuthCredentialsEntityFactory>(),
    ),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i21.BookEntityFactory>(() => _i21.BookEntityFactory(
        authorEntityFactory: get<_i6.AuthorEntityFactory>(),
        genreEntityFactory: get<_i10.GenreEntityFactory>(),
      ));
  gh.factory<_i22.BookWithAvailabilityEntityFactory>(
      () => _i22.BookWithAvailabilityEntityFactory(
            authorEntityFactory: get<_i6.AuthorEntityFactory>(),
            genreEntityFactory: get<_i10.GenreEntityFactory>(),
          ));
  gh.factory<_i23.BooksApi>(() => _i23.BooksApi.create(get<_i8.Dio>()));
  gh.factory<_i7.BooksRepository>(
    () => _i24.BooksRepositoryImpl(
      booksApi: get<_i23.BooksApi>(),
      bookEntityFactory: get<_i21.BookEntityFactory>(),
      bookEntityWithAvailabilityFactory:
          get<_i22.BookWithAvailabilityEntityFactory>(),
    ),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i25.BooksSearchBloc>(() => _i25.BooksSearchBloc(
        getBookById: get<_i11.GetBookByIdUsecase>(),
        getBooksByTitleOrAuthor: get<_i13.GetBooksByTitleOrAuthorUsecase>(),
      ));
  gh.factory<_i11.GetBookByIdUsecase>(
    () => _i11.GetBookByIdUsecase(repository: get<_i7.BooksRepository>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i13.GetBooksByTitleOrAuthorUsecase>(
    () => _i13.GetBooksByTitleOrAuthorUsecase(
        repository: get<_i7.BooksRepository>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i14.LogInUsecase>(
    () => _i14.LogInUsecase(authService: get<_i5.AuthService>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i15.LogOutUsecase>(
    () => _i15.LogOutUsecase(authService: get<_i5.AuthService>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  return get;
}

class _$TestModule extends _i26.TestModule {}

class _$AuthTestModule extends _i27.AuthTestModule {}

class _$BooksTestModule extends _i28.BooksTestModule {}

class _$AppModule extends _i29.AppModule {}

class _$AuthModule extends _i30.AuthModule {}
