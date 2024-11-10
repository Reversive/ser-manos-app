import 'package:image_picker/image_picker.dart';

abstract interface class ImageRepository {
  Future<String> postProfileImage(String uuid, XFile image);
}