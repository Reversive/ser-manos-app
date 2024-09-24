import 'package:firebase_auth/firebase_auth.dart';
import 'package:ser_manos/src/features/auth/interfaces/auth_repository.dart';
import 'package:ser_manos/src/features/auth/models/auth_exception.dart';

class AuthRepositoryImpl implements AuthRepository<UserCredential> {
  const AuthRepositoryImpl({required this.auth});
  final FirebaseAuth auth;

  @override
  Future<void> signIn(
    String email,
    String password,
  ) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw AuthException(translateErrorMessage(e));
    }
  }

  @override
  Future<void> signOut() async {
    await auth.signOut();
  }

  @override
  Future<UserCredential> signUp(
    String email,
    String password,
  ) async {
    try {
      return await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw AuthException(translateErrorMessage(e));
    }
  }
}

String translateErrorMessage(FirebaseAuthException e) {
  switch (e.code) {
    case 'email-already-in-use':
      return 'Email en uso';
    case 'weak-password':
      return 'Contraseña débil';
    case 'user-not-found' || 'wrong-password' || 'invalid-credential':
      return 'Usuario o contraseña incorrectos';
    default:
      return 'Error desconocido ${e.code}';
  }
}
