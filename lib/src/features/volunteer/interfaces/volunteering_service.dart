import 'package:ser_manos/src/features/volunteer/models/volunteering.dart';

abstract interface class VolunteeringService {
  Stream<List<Volunteering>> getVolunteerings();
  Future<Volunteering> getVolunteeringById(String id);
}