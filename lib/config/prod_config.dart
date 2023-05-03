import 'package:clean_arch/config/app_config.dart';

/// Production configuration
class ProdConfig implements AppConfig {
  @override
  String get baseUrl => 'https://dummyjson.com';
}
