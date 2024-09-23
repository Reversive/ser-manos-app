import 'package:firebase_auth/firebase_auth.dart';
import 'package:ser_manos/src/features/auth/interfaces/auth_repository.dart';
import 'package:ser_manos/src/features/auth/interfaces/auth_service.dart';
import 'package:ser_manos/src/features/auth/interfaces/user_service.dart';

class AuthServiceImpl implements AuthService {
  const AuthServiceImpl({
    required this.authRepository,
    required this.userService,
  });
  final AuthRepository<UserCredential> authRepository;
  final UserService userService;

  @override
  Future<void> signIn(String email, String password) async {
    await authRepository.signIn(email, password);
  }

  @override
  Future<void> signOut() async {
    await authRepository.signOut();
  }

  @override
  Future<void> signUp(
    String name,
    String surname,
    String email,
    String password,
  ) async {
    UserCredential credential = await authRepository.signUp(
      email,
      password,
    );
    return userService.postUser(
      credential.user!.uid,
      name,
      surname,
    );
  }
}
