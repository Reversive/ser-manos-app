import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/src/features/auth/interfaces/user_repository.dart';
import 'package:ser_manos/src/features/auth/interfaces/user_service.dart';
import 'package:ser_manos/src/features/auth/persistence/user_repository_impl.dart';
import 'package:ser_manos/src/core/providers/firebase_provider.dart';
import 'package:ser_manos/src/features/auth/services/user_service_impl.dart';
part 'user_provider.g.dart';

@Riverpod(keepAlive: true)
UserRepository userRepository(UserRepositoryRef ref) {
  return UserRepositoryImpl(
    store: ref.read(
      firebaseFirestoreProvider,
    ),
  );
}

@Riverpod(keepAlive: true)
UserService userService(UserServiceRef ref) {
  return UserServiceImpl(
    userRepository: ref.read(
      userRepositoryProvider,
    ),
  );
}
