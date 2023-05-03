import 'package:clean_arch/config/app_environment.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  /// Getter that returns singleton instance of Dio
  @singleton
  Dio get dio => Dio(
        BaseOptions(
          baseUrl: AppEnvironment.instance.config.baseUrl,
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      )..interceptors.add(PrettyDioLogger());
}
