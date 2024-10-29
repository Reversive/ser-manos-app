import 'package:ser_manos/src/features/profile/models/location.dart';
import 'package:ser_manos/src/features/volunteer/models/volunteering.dart';

abstract interface class VolunteeringService {
  Future<List<Volunteering>> getVolunteerings(Location? location, String? search);
  Future<Volunteering> getVolunteeringById(String id);
  Stream<int> getVacanciesStreamById(String id);
  Future<void> applyToVolunteering(String volunteeringId);
  Future<void> cancelApplicationToVolunteering(String volunteeringId);
  Future<void> abandonVolunteering(String volunteeringId);
  Stream<bool> isPostulatedOrVolunteering(String uuid);
  Stream<bool> isPostulated(String uuid, String volunteeringId);
  Stream<bool> isVolunteering(String uuid, String volunteeringId);
}