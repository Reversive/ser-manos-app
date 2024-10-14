import 'package:image_picker/image_picker.dart';

abstract interface class ImageService {
  Future<String> postProfileImage(String uuid, XFile image);
}