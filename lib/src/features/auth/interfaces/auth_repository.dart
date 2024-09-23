abstract interface class AuthRepository<T> {
  Future<void> signIn(String email, String password);
  Future<T> signUp(
    String email,
    String password,
  );
  Future<void> signOut();
}
