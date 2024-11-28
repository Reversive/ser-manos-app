abstract interface class AuthFacade {
  bool isAuthenticated();
  Stream<bool> authStateChanges();
}