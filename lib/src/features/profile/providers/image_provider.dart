import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/src/core/providers/firebase_provider.dart';
import 'package:ser_manos/src/features/profile/interfaces/image_repository.dart';
import 'package:ser_manos/src/features/profile/interfaces/image_service.dart';
import 'package:ser_manos/src/features/profile/persistence/image_repository_impl.dart';
import 'package:ser_manos/src/features/profile/services/image_service_impl.dart';
part 'generated/image_provider.g.dart';

@Riverpod(keepAlive: true)
ImageRepository imageRepository(Ref ref) {
  return ImageRepositoryImpl(
    storage: ref.watch(
      firebaseStorageProvider,
    ),
  );
}

@Riverpod(keepAlive: true)
ImageService imageService(Ref ref) {
  return ImageServiceImpl(
    imageRepository: ref.watch(
      imageRepositoryProvider,
    ),
  );
}