import 'package:image_picker/image_picker.dart';
import 'package:ser_manos/src/features/profile/interfaces/image_repository.dart';
import 'package:ser_manos/src/features/profile/interfaces/image_service.dart';

class ImageServiceImpl implements ImageService {
  const ImageServiceImpl({required this.imageRepository});
  final ImageRepository imageRepository;
  @override
  Future<String> postProfileImage(String uuid, XFile image) {
    return imageRepository.postProfileImage(uuid, image);
  }
}
