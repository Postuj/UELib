import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/core/domain/usecases/usecase.dart';
import 'package:mobile/core/error/failure.dart';
import 'package:mobile/features/auth/domain/entities/auth_credentials.dart';
import 'package:mobile/features/auth/domain/services/auth_service.dart';

@Injectable(env: ['dev', 'prod'])
class LogInUsecase extends UseCase<AuthCredentials, LogInParams> {
  final AuthService _authService;

  LogInUsecase({required AuthService authService}) : _authService = authService;

  @override
  Future<Either<Failure, AuthCredentials>> call(LogInParams params) async {
    await Future.delayed(const Duration(seconds: 2));
    return _authService.logIn(params.email, params.password);
  }
}

class LogInParams extends Equatable {
  final String email;
  final String password;

  const LogInParams({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
