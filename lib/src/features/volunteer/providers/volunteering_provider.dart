import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/src/core/providers/firebase_provider.dart';
import 'package:ser_manos/src/features/volunteer/interfaces/volunteering_repository.dart';
import 'package:ser_manos/src/features/volunteer/interfaces/volunteering_service.dart';
import 'package:ser_manos/src/features/volunteer/models/volunteering.dart';
import 'package:ser_manos/src/features/volunteer/persistence/volunteering_repository_impl.dart';
import 'package:ser_manos/src/features/volunteer/services/volunteering_service_impl.dart';

part 'volunteering_provider.g.dart';

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
  );
}

@riverpod
Future<List<Volunteering>> volunteeringList(VolunteeringListRef ref) {
  return ref.watch(volunteeringServiceProvider).getVolunteerings();
}

@riverpod
Future<Volunteering> volunteeringDetail(VolunteeringDetailRef ref, String id) {
  return ref.watch(volunteeringServiceProvider).getVolunteeringById(id);
}