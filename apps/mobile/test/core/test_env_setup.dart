import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile/core/data/sources/env.dart';

Future<void> loadTestEnvVars() async {
  await dotenv.load(fileName: '.env.dev');
}
