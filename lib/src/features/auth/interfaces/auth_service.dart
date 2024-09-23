abstract interface class AuthService {
  Future<void> signIn(String email, String password);
  Future<void> signUp(
    String name,
    String surname,
    String email,
    String password,
  );
  Future<void> signOut();

}