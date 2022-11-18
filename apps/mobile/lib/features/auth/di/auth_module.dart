import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AuthModule {
  @Singleton(env: ['dev', 'prod'])
  FlutterSecureStorage get storage => const FlutterSecureStorage();
}
