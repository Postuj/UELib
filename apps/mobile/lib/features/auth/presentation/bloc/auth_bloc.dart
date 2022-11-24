import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/core/domain/usecases/usecase.dart';
import 'package:mobile/core/presentation/router/router.dart';
import 'package:mobile/features/auth/domain/usecases/log_in_usecase.dart';
import 'package:mobile/features/auth/domain/usecases/log_out_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LogInUsecase _logIn;
  final LogOutUsecase _logOut;
  final AppRouter _router;

  AuthBloc({
    required LogInUsecase logIn,
    required LogOutUsecase logOut,
    required AppRouter router,
  })  : _logIn = logIn,
        _logOut = logOut,
        _router = router,
        super(AuthNotAuthenticatedState()) {
    on<LogInEvent>(_handleLogInEvent);
    on<LogOutEvent>(_handleLogOutEvent);
  }

  Future<void> _handleLogInEvent(
      LogInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    final result =
        await _logIn(LogInParams(email: event.email, password: event.password));
    result.fold(
      (l) => emit(AuthErrorState()),
      (r) {
        emit(AuthAuthenticatedState());
        _router.push(const HomeRoute());
      },
    );
  }

  Future<void> _handleLogOutEvent(
      LogOutEvent event, Emitter<AuthState> emit) async {
    final result = await _logOut(const NoParams());
    result.fold(
      (l) => emit(AuthErrorState()),
      (r) {
        emit(AuthNotAuthenticatedState());
        _router.push(const LoginRoute());
      },
    );
  }
}
