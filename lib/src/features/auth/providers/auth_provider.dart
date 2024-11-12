import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/src/features/auth/interfaces/auth_repository.dart';
import 'package:ser_manos/src/features/auth/interfaces/auth_service.dart';
import 'package:ser_manos/src/features/auth/persistence/auth_repository_impl.dart';
import 'package:ser_manos/src/core/providers/firebase_provider.dart';
import 'package:ser_manos/src/features/auth/services/auth_service_impl.dart';
import 'package:ser_manos/src/features/auth/providers/user_provider.dart';
import 'package:ser_manos/src/features/auth/models/user.dart' as sm;

part 'generated/auth_provider.g.dart';

@Riverpod(keepAlive: true)
AuthRepository<UserCredential> authRepository(Ref ref) {
  return AuthRepositoryImpl(
    auth: ref.watch(
      firebaseAuthProvider,
    ),
    store: ref.watch(
      firebaseFirestoreProvider,
    ),
  );
}

@Riverpod(keepAlive: true)
AuthService authService(Ref ref) {
  return AuthServiceImpl(
    authRepository: ref.watch(
      authRepositoryProvider,
    ),
    userService: ref.watch(
      userServiceProvider,
    ),
  );
}

@riverpod
Stream<sm.User> currentUser(Ref ref) {
  return ref.watch(authServiceProvider).getCurrentUser();
}
