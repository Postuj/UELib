import 'package:injectable/injectable.dart';
import 'package:mobile/core/data/sources/env.dart';
import 'package:mobile/di/injection.dart';

import 'test_env_injection.config.dart';

@InjectableInit(generateForDir: ['test', 'lib'])
void configureTestDependencyInjection() =>
    $initGetIt(getIt, environment: Env.test);
