import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/core/domain/usecases/usecase.dart';
import 'package:mobile/core/error/failure.dart';
import 'package:mobile/features/auth/domain/services/auth_service.dart';

@Injectable(env: ['dev', 'prod'])
class LogOutUsecase extends UseCase<void, NoParams> {
  final AuthService _authService;

  LogOutUsecase({required AuthService authService})
      : _authService = authService;

  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return _authService.logOut();
  }
}
