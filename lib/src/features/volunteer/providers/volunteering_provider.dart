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
VolunteeringRepository volunteeringRepository(VolunteeringRepositoryRef ref) {
  return VolunteeringRepositoryImpl(
    store: ref.watch(firebaseFirestoreProvider),
  );
}

@Riverpod(keepAlive: true)
VolunteeringService volunteeringService(VolunteeringServiceRef ref) {
  return VolunteeringServiceImpl(
    repository: ref.watch(volunteeringRepositoryProvider),
    authService: ref.watch(authServiceProvider),
  );
}

@riverpod
Future<List<Volunteering>> volunteeringList(
  VolunteeringListRef ref,
  Location? location,
  String? search,
) {
  return ref.watch(volunteeringServiceProvider).getVolunteerings(
        location,
        search,
      );
}

@riverpod
Future<Volunteering> volunteeringDetail(VolunteeringDetailRef ref, String id) {
  return ref.watch(volunteeringServiceProvider).getVolunteeringById(id);
}

@riverpod
Stream<int> volunteeringVacancies(VolunteeringVacanciesRef ref, String id) {
  return ref.watch(volunteeringServiceProvider).getVacanciesStreamById(id);
}

@riverpod
Stream<bool> volunteeringIsPostulatedOrVolunteering(
    VolunteeringIsPostulatedOrVolunteeringRef ref, String uuid) {
  return ref
      .watch(volunteeringServiceProvider)
      .isPostulatedOrVolunteering(uuid);
}

@riverpod
Stream<bool> volunteeringIsPostulated(
    VolunteeringIsPostulatedRef ref, String uuid, String volunteeringId) {
  return ref
      .watch(volunteeringServiceProvider)
      .isPostulated(uuid, volunteeringId);
}

@riverpod
Stream<bool> volunteeringIsVolunteering(
    VolunteeringIsVolunteeringRef ref, String uuid, String volunteeringId) {
  return ref
      .watch(volunteeringServiceProvider)
      .isVolunteering(uuid, volunteeringId);
}
