import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/core/presentation/router/router.dart';
import 'package:mobile/features/auth/domain/services/auth_service.dart';

@injectable
class RouteAuthGuard extends AutoRouteGuard {
  final AuthService _authService;

  RouteAuthGuard({required AuthService authService})
      : _authService = authService;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final isAuthenticated = await _authService.getIsAuthenticated();
    if (isAuthenticated) {
      resolver.next(true);
    } else {
      router.push(const LoginRoute());
    }
  }
}
