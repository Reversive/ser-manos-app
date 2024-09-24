import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/src/features/auth/models/auth_state.dart';
import 'package:ser_manos/src/features/auth/providers/auth_provider.dart';
part 'auth_controller.g.dart';

@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  @override
  AuthState build() {
    return const AuthState.initial();
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    state = const AuthState.loading();
    try {
      await ref
          .read(authServiceProvider)
          .signIn(email: email, password: password);
      state = const AuthState.authenticated();
    } catch (e) {
      state = AuthState.unauthenticated(message: e.toString());
    }
  }

  Future<void> signUp({
    required String name,
    required String surname,
    required String email,
    required String password,
  }) async {
    state = const AuthState.loading();
    try {
      await ref.read(authServiceProvider).signUp(
            name: name,
            surname: surname,
            email: email,
            password: password,
          );
      state = const AuthState.authenticated();
    } catch (e) {
      state = AuthState.unauthenticated(message: e.toString());
    }
  }

  Future<void> signOut() async {
    state = const AuthState.loading();
    await ref.read(authServiceProvider).signOut();
    state = const AuthState.unauthenticated();
  }
}
