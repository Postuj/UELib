// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/di/app_module.dart' as _i25;
import '../core/presentation/router/router.dart' as _i21;
import '../features/auth/data/factories/auth_credentials_entity_factory.dart'
    as _i3;
import '../features/auth/data/services/auth_service_impl.dart' as _i10;
import '../features/auth/data/sources/auth_api.dart' as _i8;
import '../features/auth/data/sources/interceptors/auth_interceptor.dart'
    as _i23;
import '../features/auth/di/auth_module.dart' as _i26;
import '../features/auth/domain/services/auth_service.dart' as _i9;
import '../features/auth/domain/usecases/log_in_usecase.dart' as _i18;
import '../features/auth/domain/usecases/log_out_usecase.dart' as _i19;
import '../features/auth/presentation/bloc/auth_bloc.dart' as _i22;
import '../features/auth/presentation/router/route_auth_guard.dart' as _i20;
import '../features/books/data/factories/author_entity_factory.dart' as _i4;
import '../features/books/data/factories/book_entity_factory.dart' as _i11;
import '../features/books/data/factories/book_with_availability_entity_factory.dart'
    as _i12;
import '../features/books/data/factories/genre_entity_factory.dart' as _i7;
import '../features/books/data/repositories/books_repository_impl.dart' as _i15;
import '../features/books/data/sources/books_api.dart' as _i13;
import '../features/books/domain/repositories/books_repository.dart' as _i14;
import '../features/books/domain/usecases/get_book_by_id_usecase.dart' as _i16;
import '../features/books/domain/usecases/get_books_by_title_or_author_usecase.dart'
    as _i17;
import '../features/books_search/presentation/bloc/books_search_bloc.dart'
    as _i24;

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
  final appModule = _$AppModule();
  final authModule = _$AuthModule();
  gh.factory<_i3.AuthCredentialsEntityFactory>(
      () => _i3.AuthCredentialsEntityFactory());
  gh.factory<_i4.AuthorEntityFactory>(() => _i4.AuthorEntityFactory());
  gh.singleton<_i5.Dio>(
    appModule.dio,
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.singleton<_i6.FlutterSecureStorage>(
    authModule.storage,
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i7.GenreEntityFactory>(() => _i7.GenreEntityFactory());
  gh.factory<_i8.AuthApi>(() => _i8.AuthApi.create(get<_i5.Dio>()));
  gh.factory<_i9.AuthService>(
    () => _i10.AuthServiceImpl(
      authApi: get<_i8.AuthApi>(),
      storage: get<_i6.FlutterSecureStorage>(),
      authCredentialsEntityFactory: get<_i3.AuthCredentialsEntityFactory>(),
    ),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i11.BookEntityFactory>(() => _i11.BookEntityFactory(
        authorEntityFactory: get<_i4.AuthorEntityFactory>(),
        genreEntityFactory: get<_i7.GenreEntityFactory>(),
      ));
  gh.factory<_i12.BookWithAvailabilityEntityFactory>(
      () => _i12.BookWithAvailabilityEntityFactory(
            authorEntityFactory: get<_i4.AuthorEntityFactory>(),
            genreEntityFactory: get<_i7.GenreEntityFactory>(),
          ));
  gh.factory<_i13.BooksApi>(() => _i13.BooksApi.create(get<_i5.Dio>()));
  gh.factory<_i14.BooksRepository>(
    () => _i15.BooksRepositoryImpl(
      booksApi: get<_i13.BooksApi>(),
      bookEntityFactory: get<_i11.BookEntityFactory>(),
      bookEntityWithAvailabilityFactory:
          get<_i12.BookWithAvailabilityEntityFactory>(),
    ),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i16.GetBookByIdUsecase>(
    () => _i16.GetBookByIdUsecase(repository: get<_i14.BooksRepository>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i17.GetBooksByTitleOrAuthorUsecase>(
    () => _i17.GetBooksByTitleOrAuthorUsecase(
        repository: get<_i14.BooksRepository>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i18.LogInUsecase>(
    () => _i18.LogInUsecase(authService: get<_i9.AuthService>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i19.LogOutUsecase>(
    () => _i19.LogOutUsecase(authService: get<_i9.AuthService>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i20.RouteAuthGuard>(
      () => _i20.RouteAuthGuard(authService: get<_i9.AuthService>()));
  gh.singleton<_i21.AppRouter>(
    _i21.AppRouter(routeAuthGuard: get<_i20.RouteAuthGuard>()),
    registerFor: {
      _dev,
      _prod,
    },
  );
  gh.factory<_i22.AuthBloc>(() => _i22.AuthBloc(
        logIn: get<_i18.LogInUsecase>(),
        logOut: get<_i19.LogOutUsecase>(),
        router: get<_i21.AppRouter>(),
      ));
  gh.factory<_i23.AuthInterceptor>(
      () => _i23.AuthInterceptor(authService: get<_i9.AuthService>()));
  gh.factory<_i24.BooksSearchBloc>(() => _i24.BooksSearchBloc(
        getBookById: get<_i16.GetBookByIdUsecase>(),
        getBooksByTitleOrAuthor: get<_i17.GetBooksByTitleOrAuthorUsecase>(),
      ));
  return get;
}

class _$AppModule extends _i25.AppModule {}

class _$AuthModule extends _i26.AuthModule {}
