import 'package:ser_manos/src/features/volunteer/interfaces/volunteering_repository.dart';
import 'package:ser_manos/src/features/volunteer/interfaces/volunteering_service.dart';
import 'package:ser_manos/src/features/volunteer/models/volunteering.dart';

class VolunteeringServiceImpl implements VolunteeringService {
  const VolunteeringServiceImpl({required this.repository});
  final VolunteeringRepository repository;

  @override
  Stream<List<Volunteering>> getVolunteerings() {
    return repository.getVolunteerings();
  }

  @override
  Future<Volunteering> getVolunteeringById(String id) {
    return repository.getVolunteeringById(id);
  }
}