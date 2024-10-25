import 'package:freezed_annotation/freezed_annotation.dart';
part 'generated/auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.authenticated() = _Authenticated;
  const factory AuthState.unauthenticated({String? message}) = _Unauthenticated;
}

extension AuthStateX on AuthState {
  bool get isLoading => this is _Loading;
  bool get isAuthenticated => this is _Authenticated;
  bool get isUnauthenticated => this is _Unauthenticated;
}
