import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/src/core/providers/firebase_provider.dart';
import 'package:ser_manos/src/features/auth/providers/auth_provider.dart';
import 'package:ser_manos/src/features/profile/models/location.dart';
import 'package:ser_manos/src/features/volunteer/interfaces/volunteering_repository.dart';
import 'package:ser_manos/src/features/volunteer/interfaces/volunteering_service.dart';
import 'package:ser_manos/src/features/volunteer/models/volunteering.dart';
import 'package:ser_manos/src/features/volunteer/persistence/volunteering_repository_impl.dart';
import 'package:ser_manos/src/features/volunteer/services/volunteering_service_impl.dart';

part 'generated/volunteering_provider.g.dart';

@Riverpod(keepAlive: true)
VolunteeringRepository volunteeringRepository(Ref ref) {
  return VolunteeringRepositoryImpl(
    store: ref.watch(firebaseFirestoreProvider),
  );
}

@Riverpod(keepAlive: true)
VolunteeringService volunteeringService(Ref ref) {
  return VolunteeringServiceImpl(
    repository: ref.watch(volunteeringRepositoryProvider),
    authService: ref.watch(authServiceProvider),
  );
}

@riverpod
Future<List<Volunteering>> volunteeringList(
  Ref ref,
  Location? location,
  String? search,
) {
  return ref.watch(volunteeringServiceProvider).getVolunteerings(
        location,
        search,
      );
}

@riverpod
Future<Volunteering> volunteeringDetail(Ref ref, String id) {
  return ref.watch(volunteeringServiceProvider).getVolunteeringById(id);
}

@riverpod
Stream<int> volunteeringVacancies(Ref ref, String id) {
  return ref.watch(volunteeringServiceProvider).getVacanciesStreamById(id);
}

@riverpod
Stream<bool> volunteeringIsPostulatedOrVolunteering(Ref ref, String uuid) {
  return ref
      .watch(volunteeringServiceProvider)
      .isPostulatedOrVolunteering(uuid);
}

@riverpod
Stream<bool> volunteeringIsPostulated(
    Ref ref, String uuid, String volunteeringId) {
  return ref
      .watch(volunteeringServiceProvider)
      .isPostulated(uuid, volunteeringId);
}

@riverpod
Stream<bool> volunteeringIsVolunteering(
    Ref ref, String uuid, String volunteeringId) {
  return ref
      .watch(volunteeringServiceProvider)
      .isVolunteering(uuid, volunteeringId);
}
