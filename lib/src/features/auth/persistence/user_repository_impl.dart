import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ser_manos/src/features/auth/interfaces/user_repository.dart';
import 'package:ser_manos/src/features/auth/models/user.dart';
import 'package:ser_manos/src/features/profile/models/gender.dart';
import 'package:ser_manos/src/features/volunteer/models/volunteering.dart';

class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl({required this.store});
  final FirebaseFirestore store;

  static const String userCollection = 'users';
  static const String volunteeringCollection = 'volunteerings';

  @override
  Future<void> postUser(String uuid, String name, String surname) {
    User user = User(
      uuid: uuid,
      name: name,
      surname: surname,
      favoriteVolunteerings: [],
    );
    final ref = store.collection(userCollection).doc(uuid);
    return ref.set(user.toJson());
  }

  @override
  Future<void> updateUser(String uuid, String? image, String birthdate,
      Gender gender, String phone, String email) {
    final ref = store.collection(userCollection).doc(uuid);
    if (image == null) {
      return ref.update({
        'birthdate': birthdate,
        'gender': gender.getGenderEnumType(),
        'phone': phone,
        'email': email,
        'completed': true,
      });
    }

    return ref.update({
      'image': image,
      'birthdate': birthdate,
      'gender': gender.getGenderEnumType(),
      'phone': phone,
      'email': email,
      'completed': true,
    });
  }

  @override
  Future<void> removeFavoriteVolunteering(String uuid, String volunteeringId) {
    final ref = store.collection(userCollection).doc(uuid);
    return ref.update({
      'favoriteVolunteerings': FieldValue.arrayRemove([volunteeringId]),
    });
  }

  @override
  Future<void> setFavoriteVolunteering(String uuid, String volunteeringId) {
    final ref = store.collection(userCollection).doc(uuid);
    return ref.update({
      'favoriteVolunteerings': FieldValue.arrayUnion([volunteeringId]),
    });
  }

  @override
  Stream<Volunteering?> getActiveVolunteering(String uuid) {
    return store
        .collection(volunteeringCollection)
        .where('postulations', arrayContains: uuid)
        .snapshots()
        .map((snapshot) {
      if (snapshot.docs.isEmpty) {
        return null;
      }
      return Volunteering.fromJson(snapshot.docs.first.data());
    });
  }
}
