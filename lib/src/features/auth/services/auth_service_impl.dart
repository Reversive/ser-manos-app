import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:ser_manos/src/features/auth/interfaces/auth_repository.dart';
import 'package:ser_manos/src/features/auth/interfaces/auth_service.dart';
import 'package:ser_manos/src/features/auth/interfaces/user_service.dart';
import 'package:ser_manos/src/features/auth/models/user.dart';

class AuthServiceImpl implements AuthService {
  const AuthServiceImpl({
    required this.authRepository,
    required this.userService,
  });
  final AuthRepository<fb.UserCredential> authRepository;
  final UserService userService;

  @override
  Future<void> signIn({required String email, required String password}) async {
    await authRepository.signIn(email, password);
  }

  @override
  Future<void> signOut() async {
    await authRepository.signOut();
  }

  @override
  Future<void> signUp({
    required String name,
    required String surname,
    required String email,
    required String password,
  }) async {
    fb.UserCredential credential = await authRepository.signUp(
      email,
      password,
    );
    return userService.postUser(
      credential.user!.uid,
      name,
      surname,
    );
  }

  @override
  Stream<User> getCurrentUser() {
    return authRepository.getCurrentUser();
  }
}
