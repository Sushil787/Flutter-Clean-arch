import 'package:clean_arch/config/app_config.dart';
import 'package:clean_arch/config/dev_config.dart';
import 'package:clean_arch/config/prod_config.dart';

class AppEnvironment {
  /// Constructor for the AppEnvironment
  AppEnvironment._() {
    _setEnvironment();
  }

  /// The current app configuration
  late final AppConfig config;

  ///The singleton instance for AppEnvironment
  static final AppEnvironment instance = AppEnvironment._();

  /// is the current environment development
  bool get isDev => config is DevConfig;

  /// Sets the app configuration based on current environment
  void _setEnvironment() {
    config = const String.fromEnvironment('ENV') == 'prod'
        ? ProdConfig()
        : DevConfig();
  }
}
