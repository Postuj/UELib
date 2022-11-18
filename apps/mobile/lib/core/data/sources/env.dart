import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class Env {
  static const dev = 'dev';
  static const prod = 'prod';
  static const test = 'test';

  static String get fileName => kReleaseMode ? '.env.prod' : '.env.dev';
  static String get current => kReleaseMode ? prod : dev;

  static String get apiUrl => dotenv.env['API_URL'] ?? '';
}

Future<void> loadEnvVars() async {
  await dotenv.load(fileName: Env.fileName);
}
