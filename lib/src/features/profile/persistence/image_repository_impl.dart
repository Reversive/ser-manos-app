import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ser_manos/src/features/profile/interfaces/image_repository.dart';

class ImageRepositoryImpl implements ImageRepository {
  ImageRepositoryImpl({required this.storage});
  final FirebaseStorage storage;

  @override
  Future<String> postProfileImage(String uuid, XFile image) async {
    final ref = storage.ref().child('users/$uuid');
    await ref.putFile(
      File(image.path),
      SettableMetadata(contentType: 'image/jpeg'),
    );
    return ref.getDownloadURL();
  }
}
