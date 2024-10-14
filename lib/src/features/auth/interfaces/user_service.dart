import 'package:image_picker/image_picker.dart';
import 'package:ser_manos/src/features/profile/models/gender.dart';

abstract interface class UserService {
  Future<void> postUser(String uuid, String name, String surname);
  Future<void> updateUser(String uuid, XFile? image, String birthdate, Gender gender, String phone, String email);
}
