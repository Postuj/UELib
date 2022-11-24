import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/presentation/styles/theme/theme.dart';
import 'package:mobile/features/auth/data/sources/interceptors/auth_interceptor.dart';

import 'core/data/sources/env.dart';
import 'core/presentation/router/router.dart';
import 'di/injection.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/books/presentation/blocs/borrowing_history/borrowing_history_bloc.dart';
import 'features/books/presentation/blocs/currently_borrowed/currently_borrowed_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xffEEEEEE),
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  await loadEnvVars();
  configureDependencyInjection();
  attachAuthInterceptor();
  runApp(const UELibApp());
}

class UELibApp extends StatelessWidget {
  const UELibApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = getIt<AppRouter>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<AuthBloc>()),
        BlocProvider(create: (_) => getIt<CurrentlyBorrowedBloc>()),
        BlocProvider(create: (_) => getIt<BorrowingHistoryBloc>()),
      ],
      child: MaterialApp.router(
        title: 'UELib',
        theme: themeData,
        routerDelegate: AutoRouterDelegate(router),
        routeInformationParser: router.defaultRouteParser(),
      ),
    );
  }
}
