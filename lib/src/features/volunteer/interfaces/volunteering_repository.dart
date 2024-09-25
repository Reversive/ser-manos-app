import 'package:ser_manos/src/features/volunteer/models/volunteering.dart';

abstract interface class VolunteeringRepository {
  Future<List<Volunteering>> getVolunteerings();
  Future<Volunteering> getVolunteeringById(String id);
}
