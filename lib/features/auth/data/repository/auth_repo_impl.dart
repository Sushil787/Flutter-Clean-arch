import 'package:clean_arch/core/constants/app_constants.dart';
import 'package:clean_arch/di/di_setup.dart';
import 'package:clean_arch/features/auth/data/service/auth_service.dart';
import 'package:clean_arch/features/auth/domain/entity/user.dart';
import 'package:clean_arch/features/auth/domain/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: AuthRepo)
/// Auth repo implementation
class AuthRepoImpl extends AuthRepo {
  AuthRepoImpl(this._authService);
  final AuthService _authService;
  final pref = getIt<SharedPreferences>();
  @override
  Future<User> signIn(Map<String, dynamic> userData) async {
    try {
      final result = await _authService.signIn(userData);
      await pref.setString(AppConstants.token, result.data.token!);
      return User.fromJson(result.response.data);
    } catch (e) {
      rethrow;
    }
  }
}
