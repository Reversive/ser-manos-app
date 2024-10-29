import 'package:ser_manos/src/features/auth/interfaces/auth_service.dart';
import 'package:ser_manos/src/features/profile/models/location.dart';
import 'package:ser_manos/src/features/volunteer/interfaces/volunteering_repository.dart';
import 'package:ser_manos/src/features/volunteer/interfaces/volunteering_service.dart';
import 'package:ser_manos/src/features/volunteer/models/volunteering.dart';

class VolunteeringServiceImpl implements VolunteeringService {
  const VolunteeringServiceImpl(
      {required this.repository, required this.authService});
  final VolunteeringRepository repository;
  final AuthService authService;

  @override
  Future<List<Volunteering>> getVolunteerings(
      Location? location, String? search) async {
    final volunteerings = await repository.getVolunteerings(search);
    volunteerings.sort((a, b) {
      if (location == null) {
        return b.creationDate.compareTo(a.creationDate);
      }
      final distanceA = a.location.distanceTo(location);
      final distanceB = b.location.distanceTo(location);
      if (distanceA == distanceB) {
        return b.creationDate.compareTo(a.creationDate);
      }
      return distanceA.compareTo(distanceB);
    });

    return volunteerings;
  }

  @override
  Future<Volunteering> getVolunteeringById(String id) {
    return repository.getVolunteeringById(id);
  }

  @override
  Stream<int> getVacanciesStreamById(String id) {
    return repository.getVacanciesStreamById(id);
  }

  @override
  Future<void> applyToVolunteering(String volunteeringId) async {
    final currentUser = await authService.getCurrentUserAsync();
    return repository.applyToVolunteering(currentUser.uuid, volunteeringId);
  }

  @override
  Future<void> cancelApplicationToVolunteering(String volunteeringId) async {
    final currentUser = await authService.getCurrentUserAsync();
    return repository.cancelApplicationToVolunteering(
        currentUser.uuid, volunteeringId);
  }

  @override
  Future<void> abandonVolunteering(String volunteeringId) async {
    final currentUser = await authService.getCurrentUserAsync();
    return repository.abandonVolunteering(currentUser.uuid, volunteeringId);
  }

  @override
  Stream<bool> isPostulatedOrVolunteering(String uuid) {
    return repository.isPostulatedOrVolunteering(uuid);
  }

  @override
  Stream<bool> isPostulated(String uuid, String volunteeringId) {
    return repository.isPostulated(uuid, volunteeringId);
  }

  @override
  Stream<bool> isVolunteering(String uuid, String volunteeringId) {
    return repository.isVolunteering(uuid, volunteeringId);
  }
}
