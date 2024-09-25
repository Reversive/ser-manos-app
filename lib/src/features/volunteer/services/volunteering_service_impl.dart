import 'package:ser_manos/src/features/profile/models/location.dart';
import 'package:ser_manos/src/features/volunteer/interfaces/volunteering_repository.dart';
import 'package:ser_manos/src/features/volunteer/interfaces/volunteering_service.dart';
import 'package:ser_manos/src/features/volunteer/models/volunteering.dart';

class VolunteeringServiceImpl implements VolunteeringService {
  const VolunteeringServiceImpl({required this.repository});
  final VolunteeringRepository repository;

  @override
  Future<List<Volunteering>> getVolunteerings(Location? location, String? search) async {
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
}