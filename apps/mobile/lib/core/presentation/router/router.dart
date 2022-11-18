import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/features/auth/presentation/router/route_auth_guard.dart';
import 'package:mobile/features/books/presentation/pages/home_page.dart';
import 'package:mobile/features/auth/presentation/pages/login_page.dart';
import 'package:mobile/features/borrow_book/presentation/pages/scan_book_page.dart';
import 'package:mobile/features/books_search/presentation/pages/search_page.dart';
import 'package:flutter/material.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(page: HomePage, initial: true, guards: [RouteAuthGuard]),
    AutoRoute(page: SearchPage, path: '/search', guards: [RouteAuthGuard]),
    AutoRoute(page: LoginPage, path: '/login'),
    AutoRoute(page: ScanBookPage, path: '/scan-book', guards: [RouteAuthGuard]),
  ],
)
@Singleton(env: ['dev', 'prod'])
class AppRouter extends _$AppRouter {
  AppRouter({required RouteAuthGuard routeAuthGuard})
      : super(routeAuthGuard: routeAuthGuard);
}
