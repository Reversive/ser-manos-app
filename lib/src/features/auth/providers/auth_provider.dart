import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/src/features/auth/interfaces/auth_repository.dart';
import 'package:ser_manos/src/features/auth/interfaces/auth_service.dart';
import 'package:ser_manos/src/features/auth/persistence/auth_repository_impl.dart';
import 'package:ser_manos/src/features/auth/providers/firebase_auth_provider.dart';
import 'package:ser_manos/src/features/auth/services/auth_service_impl.dart';
import 'package:ser_manos/src/features/auth/providers/user_provider.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
AuthRepository<UserCredential> authRepository(AuthRepositoryRef ref) {
  return AuthRepositoryImpl(
    auth: ref.read(
      firebaseAuthProvider,
    ),
  );
}

@Riverpod(keepAlive: true)
AuthService authService(AuthServiceRef ref) {
  return AuthServiceImpl(
    authRepository: ref.read(
      authRepositoryProvider,
    ),
    userService: ref.read(
      userServiceProvider,
    ),
  );
}
