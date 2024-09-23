import 'package:firebase_auth/firebase_auth.dart';
import 'package:ser_manos/src/features/auth/interfaces/auth_repository.dart';

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
      throw Exception(translateErrorMessage(e));
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
      throw Exception(translateErrorMessage(e));
    }
  }
}

String translateErrorMessage(FirebaseAuthException e) {
  switch (e.code) {
    case 'email-already-in-use':
      return 'Email already in use';
    case 'invalid-email':
      return 'Invalid email';
    case 'operation-not-allowed':
      return 'Operation not allowed';
    case 'weak-password':
      return 'Weak password';
    case 'user-not-found':
      return 'User not found';
    case 'wrong-password':
      return 'Wrong password';
    default:
      return 'An error occurred';
  }
}
