import 'package:ser_manos/src/features/volunteer/models/volunteering.dart';

abstract interface class VolunteeringRepository {
  Future<List<Volunteering>> getVolunteerings(String? search);
  Future<Volunteering> getVolunteeringById(String id);
  Stream<int> getVacanciesStreamById(String id);
  Future<void> applyToVolunteering(String uuid, String volunteeringId);
  Future<void> cancelApplicationToVolunteering(
      String uuid, String volunteeringId);
  Future<void> abandonVolunteering(String uuid, String volunteeringId);
  Stream<bool> isPostulatedOrVolunteering(String uuid);
  Stream<bool> isPostulated(String uuid, String volunteeringId);
  Stream<bool> isVolunteering(String uuid, String volunteeringId);
}
