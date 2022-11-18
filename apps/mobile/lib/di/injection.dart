import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../core/data/sources/env.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

const dev = Environment('dev');
const prod = Environment('prod');
const testEnv = Environment('test');

@InjectableInit(generateForDir: ['lib'])
void configureDependencyInjection() =>
    $initGetIt(getIt, environment: Env.current);
