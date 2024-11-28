import 'package:ser_manos/src/features/profile/models/gender.dart';
import 'package:ser_manos/src/features/volunteer/models/volunteering.dart';

abstract interface class UserRepository {
  Future<void> postUser(String uuid, String name, String surname);
  Future<void> updateUser(String uuid, String? image, String birthdate, Gender gender, String phone, String email);
  Future<void> setFavoriteVolunteering(String uuid, String volunteeringId);
  Future<void> removeFavoriteVolunteering(String uuid, String volunteeringId);
  Stream<Volunteering?> getActiveVolunteering(String uuid);
}
