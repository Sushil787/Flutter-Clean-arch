import 'package:clean_arch/features/auth/domain/entity/user.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import 'package:clean_arch/core/constants/api_constants.dart';
part 'auth_service.g.dart';

/// Auth service class
@RestApi()
@injectable
abstract class AuthService {
  @factoryMethod
  factory AuthService(Dio dio) = _AuthService;

  ///signIn method
  @POST(ApiConstants.signIn)
  Future<HttpResponse<User>> signIn(@Body() Map<String, dynamic> userData);
}
