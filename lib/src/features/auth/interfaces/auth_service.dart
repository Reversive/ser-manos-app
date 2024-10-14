import 'package:ser_manos/src/features/auth/models/user.dart';

abstract interface class AuthService {
  Future<void> signIn({
    required String email,
    required String password,
  });
  Future<void> signUp({
    required String name,
    required String surname,
    required String email,
    required String password,
  });
  Future<void> signOut();
  Future<User> getCurrentUser();
}
