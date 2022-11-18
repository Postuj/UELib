import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List properties;
  const Failure([this.properties = const <dynamic>[]]);

  @override
  List<Object> get props => [properties];
}

class ServerFailure extends Failure {}

class ServerResourceNotFoundFailure extends ServerFailure {}

class ServerForbiddenFailure extends ServerFailure {}

class ServerUnathorizedFailure extends ServerFailure {}

class ServerInternalFailure extends ServerFailure {}

class ServerUnexpectedFailure extends ServerFailure {}
