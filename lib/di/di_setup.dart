import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:clean_arch/di/di_setup.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> configureDependencies({String env = Environment.dev}) async =>
    init(getIt, environment: env);
