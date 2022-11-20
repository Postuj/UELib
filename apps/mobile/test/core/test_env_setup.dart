import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> loadTestEnvVars() async {
  await dotenv.load(fileName: '.env.dev');
}
