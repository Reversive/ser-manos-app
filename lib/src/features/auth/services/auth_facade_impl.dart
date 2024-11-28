import 'package:firebase_auth/firebase_auth.dart';
import 'package:ser_manos/src/features/auth/interfaces/auth_facade.dart';

class AuthFacadeImpl implements AuthFacade {
  final FirebaseAuth _auth;

  AuthFacadeImpl(this._auth);

  @override
  bool isAuthenticated() {
    return _auth.currentUser != null;
  }

  @override
  Stream<bool> authStateChanges() {
    return _auth.authStateChanges().map((user) => user != null);
  }
}
