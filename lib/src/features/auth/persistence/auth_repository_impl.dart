import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:ser_manos/src/features/auth/interfaces/auth_repository.dart';
import 'package:ser_manos/src/features/auth/models/auth_exception.dart';
import 'package:ser_manos/src/features/auth/models/user.dart';

class AuthRepositoryImpl implements AuthRepository<fb.UserCredential> {
  const AuthRepositoryImpl({required this.auth, required this.store});
  final fb.FirebaseAuth auth;
  final FirebaseFirestore store;

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
    } on fb.FirebaseAuthException catch (e) {
      throw AuthException(translateErrorMessage(e));
    }
  }

  @override
  Future<void> signOut() async {
    await auth.signOut();
  }

  @override
  Future<fb.UserCredential> signUp(
    String email,
    String password,
  ) async {
    try {
      return await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on fb.FirebaseAuthException catch (e) {
      throw AuthException(translateErrorMessage(e));
    }
  }

  @override
  Future<User> getCurrentUser() {
    final user = auth.currentUser;
    if (user == null) {
      throw Exception('User not found');
    }
    return store
        .collection('users')
        .doc(user.uid)
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        return User.fromJson(snapshot.data()!);
      } else {
        throw Exception('User not found');
      }
    });
  }
}

String translateErrorMessage(fb.FirebaseAuthException e) {
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
