import 'package:ser_manos/src/features/auth/models/user.dart';

abstract interface class AuthRepository<T> {
  Future<void> signIn(String email, String password);
  Future<T> signUp(
    String email,
    String password,
  );
  Future<void> signOut();
  Stream<User> getCurrentUser();
  Future<User> getCurrentUserAsync();
}
