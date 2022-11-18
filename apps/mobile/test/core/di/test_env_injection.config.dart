// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i8;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:mobile/core/di/app_module.dart' as _i27;
import 'package:mobile/core/presentation/router/router.dart' as _i3;
import 'package:mobile/features/auth/data/factories/auth_credentials_entity_factory.dart'
    as _i4;
import 'package:mobile/features/auth/data/services/auth_service_impl.dart'
    as _i19;
import 'package:mobile/features/auth/data/sources/auth_api.dart' as _i16;
import 'package:mobile/features/auth/data/sources/interceptors/auth_interceptor.dart'
    as _i18;
import 'package:mobile/features/auth/di/auth_module.dart' as _i28;
import 'package:mobile/features/auth/domain/services/auth_service.dart' as _i5;
import 'package:mobile/features/auth/domain/usecases/log_in_usecase.dart'
    as _i13;
import 'package:mobile/features/auth/domain/usecases/log_out_usecase.dart'
    as _i14;
import 'package:mobile/features/auth/presentation/bloc/auth_bloc.dart' as _i17;
import 'package:mobile/features/auth/presentation/router/route_auth_guard.dart'
    as _i15;
import 'package:mobile/features/books/data/factories/author_entity_factory.dart'
    as _i6;
import 'package:mobile/features/books/data/factories/book_entity_factory.dart'
    as _i20;
import 'package:mobile/features/books/data/factories/genre_entity_factory.dart'
    as _i10;
import 'package:mobile/features/books/data/repositories/books_repository_impl.dart'
    as _i22;
import 'package:mobile/features/books/data/sources/books_api.dart' as _i21;
import 'package:mobile/features/books/domain/repositories/books_repository.dart'
    as _i7;
import 'package:mobile/features/books/domain/usecases/get_book_by_id_usecase.dart'
    as _i11;
import 'package:mobile/features/books/domain/usecases/get_books_by_title_or_author_usecase.dart'
    as _i12;
import 'package:mobile/features/books_search/presentation/bloc/books_search_bloc.dart'
    as _i23;

import '../../features/auth/di/auth_test_module.dart' as _i25;
import '../../features/books/di/books_test_module.dart' as _i26;
import 'test_module.dart' as _i24;

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
  gh.factory<_i12.GetBooksByTitleOrAuthorUsecase>(
    () => booksTestModule.getBooksByTitleOrAuthorUsecase,
    registerFor: {_test},
  );
  gh.factory<_i13.LogInUsecase>(
    () => authTestModule.logInUsecase,
    registerFor: {_test},
  );
  gh.factory<_i14.LogOutUsecase>(
    () => authTestModule.logOutUsecase,
    registerFor: {_test},
  );
  gh.factory<_i15.RouteAuthGuard>(
      () => _i15.RouteAuthGuard(authService: get<_i5.AuthService>()));
  gh.singleton<_i3.AppRouter>(
    _i3.AppRouter(routeAuthGuard: get<_i15.RouteAuthGuard>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i16.AuthApi>(() => _i16.AuthApi.create(get<_i8.Dio>()));
  gh.factory<_i17.AuthBloc>(() => _i17.AuthBloc(
        logIn: get<_i13.LogInUsecase>(),
        logOut: get<_i14.LogOutUsecase>(),
        router: get<_i3.AppRouter>(),
      ));
  gh.factory<_i18.AuthInterceptor>(
      () => _i18.AuthInterceptor(authService: get<_i5.AuthService>()));
  gh.factory<_i5.AuthService>(
    () => _i19.AuthServiceImpl(
      authApi: get<_i16.AuthApi>(),
      storage: get<_i9.FlutterSecureStorage>(),
      authCredentialsEntityFactory: get<_i4.AuthCredentialsEntityFactory>(),
    ),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i20.BookEntityFactory>(() => _i20.BookEntityFactory(
        authorEntityFactory: get<_i6.AuthorEntityFactory>(),
        genreEntityFactory: get<_i10.GenreEntityFactory>(),
      ));
  gh.factory<_i21.BooksApi>(() => _i21.BooksApi.create(get<_i8.Dio>()));
  gh.factory<_i7.BooksRepository>(
    () => _i22.BooksRepositoryImpl(
      booksApi: get<_i21.BooksApi>(),
      bookEntityFactory: get<_i20.BookEntityFactory>(),
    ),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i23.BooksSearchBloc>(() => _i23.BooksSearchBloc(
        getBookById: get<_i11.GetBookByIdUsecase>(),
        getBooksByTitleOrAuthor: get<_i12.GetBooksByTitleOrAuthorUsecase>(),
      ));
  gh.factory<_i11.GetBookByIdUsecase>(
    () => _i11.GetBookByIdUsecase(repository: get<_i7.BooksRepository>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i12.GetBooksByTitleOrAuthorUsecase>(
    () => _i12.GetBooksByTitleOrAuthorUsecase(
        repository: get<_i7.BooksRepository>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i13.LogInUsecase>(
    () => _i13.LogInUsecase(authService: get<_i5.AuthService>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i14.LogOutUsecase>(
    () => _i14.LogOutUsecase(authService: get<_i5.AuthService>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  return get;
}

class _$TestModule extends _i24.TestModule {}

class _$AuthTestModule extends _i25.AuthTestModule {}

class _$BooksTestModule extends _i26.BooksTestModule {}

class _$AppModule extends _i27.AppModule {}

class _$AuthModule extends _i28.AuthModule {}
