import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ser_manos/src/features/auth/interfaces/user_repository.dart';
import 'package:ser_manos/src/features/auth/models/user.dart';

class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl({required this.store});
  final FirebaseFirestore store;

  @override
  Future<void> postUser(String uuid, String name, String surname) {
    User user = User(
      uuid: uuid,
      name: name,
      surname: surname,
    );
    final ref = store.collection('users').doc(uuid);
    return ref.set(user.toJson());
  }
}
