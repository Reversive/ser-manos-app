import 'package:ser_manos/src/features/volunteer/models/volunteering.dart';

abstract interface class VolunteeringRepository {
  Stream<List<Volunteering>> getVolunteerings();
  Future<Volunteering> getVolunteeringById(String id);
}
