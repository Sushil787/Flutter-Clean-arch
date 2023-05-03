import 'package:bloc/bloc.dart';
import 'package:clean_arch/features/auth/domain/entity/user.dart';
import 'package:clean_arch/features/auth/domain/repository/auth_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._authRepo) : super(const _Initial()) {
    on<AuthEvent>((event, emit) async {
      await event.when(
          login: (String uname, String password) =>
              _login(emit, uname, password));
    });
  }
  final AuthRepo _authRepo;

  _login(Emitter<AuthState> emit, String uname, String password) async {
    try {
      emit(const AuthState.loading());
      var data = {'username': uname, 'password': password};
      final result = await _authRepo.signIn(data);
      emit(AuthState.success(user: result));
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }
}
