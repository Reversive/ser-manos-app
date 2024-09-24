import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ser_manos/src/features/volunteer/interfaces/volunteering_repository.dart';
import 'package:ser_manos/src/features/volunteer/models/volunteering.dart';

class VolunteeringRepositoryImpl implements VolunteeringRepository {
  const VolunteeringRepositoryImpl({required this.store});
  final FirebaseFirestore store;
  static const String collectionName = 'volunteerings';

  @override
  Future<Volunteering> getVolunteeringById(String id) async {
    final collection = store.collection(collectionName);
    final document = await collection.doc(id).get();
    if (document.exists) {
      return Volunteering.fromJson(document.data()!);
    }
    throw Exception('Volunteering not found');
  }

  @override
  Stream<List<Volunteering>> getVolunteerings() {
    final snapshot = store.collection(collectionName).snapshots();

    return snapshot.map(
      (query) => [
        for (final item in query.docs) Volunteering.fromJson(item.data()),
      ],
    );
  }
}
