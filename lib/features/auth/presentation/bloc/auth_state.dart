part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = Loading;
  const factory AuthState.success({required User user}) = Success;
  const factory AuthState.error(String error) = Error;
  
}
