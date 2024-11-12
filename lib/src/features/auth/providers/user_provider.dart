import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/src/features/auth/interfaces/user_repository.dart';
import 'package:ser_manos/src/features/auth/interfaces/user_service.dart';
import 'package:ser_manos/src/features/auth/persistence/user_repository_impl.dart';
import 'package:ser_manos/src/core/providers/firebase_provider.dart';
import 'package:ser_manos/src/features/auth/services/user_service_impl.dart';
import 'package:ser_manos/src/features/profile/providers/image_provider.dart';
import 'package:ser_manos/src/features/volunteer/models/volunteering.dart';
part 'generated/user_provider.g.dart';

@Riverpod(keepAlive: true)
UserRepository userRepository(Ref ref) {
  return UserRepositoryImpl(
      store: ref.watch(
    firebaseFirestoreProvider,
  ));
}

@Riverpod(keepAlive: true)
UserService userService(Ref ref) {
  return UserServiceImpl(
    userRepository: ref.watch(
      userRepositoryProvider,
    ),
    imageService: ref.watch(
      imageServiceProvider,
    ),
  );
}

@riverpod
Future<Volunteering?> activeVolunteering(Ref ref, String uuid) {
  return ref.watch(userServiceProvider).getActiveVolunteering(uuid);
}