import 'package:image_picker/image_picker.dart';
import 'package:ser_manos/src/features/auth/interfaces/user_repository.dart';
import 'package:ser_manos/src/features/auth/interfaces/user_service.dart';
import 'package:ser_manos/src/features/profile/interfaces/image_service.dart';
import 'package:ser_manos/src/features/profile/models/gender.dart';

class UserServiceImpl implements UserService {
  const UserServiceImpl(
      {required this.userRepository, required this.imageService});
  final UserRepository userRepository;
  final ImageService imageService;

  @override
  Future<void> postUser(String uuid, String name, String surname) {
    return userRepository.postUser(uuid, name, surname);
  }

  @override
  Future<void> updateUser(String uuid, XFile? image, String birthdate,
      Gender gender, String phone, String email) async {
    final imageUrl =
        image != null ? await imageService.postProfileImage(uuid, image) : null;
    return userRepository.updateUser(
        uuid, imageUrl, birthdate, gender, phone, email);
  }

  @override
  Future<void> removeFavoriteVolunteering(String uuid, String volunteeringId) {
    return userRepository.removeFavoriteVolunteering(uuid, volunteeringId);
  }

  @override
  Future<void> setFavoriteVolunteering(String uuid, String volunteeringId) {
    return userRepository.setFavoriteVolunteering(uuid, volunteeringId);
  }
}
