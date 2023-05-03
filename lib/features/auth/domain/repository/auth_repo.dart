import 'package:clean_arch/features/auth/domain/entity/user.dart';

// import 'package:dartz/dartz.dart';
// import 'package:retrofit/retrofit.dart';


/// Auth repo abstract class
abstract class AuthRepo {
  Future<User> signIn(Map<String, dynamic> userData);
}
