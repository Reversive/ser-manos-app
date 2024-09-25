import 'package:ser_manos/src/features/profile/models/location.dart';
import 'package:ser_manos/src/features/volunteer/models/volunteering.dart';

abstract interface class VolunteeringService {
  Future<List<Volunteering>> getVolunteerings(Location? location, String? search);
  Future<Volunteering> getVolunteeringById(String id);
  Stream<int> getVacanciesStreamById(String id);
}