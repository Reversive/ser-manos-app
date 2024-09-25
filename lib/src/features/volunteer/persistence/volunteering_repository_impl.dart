import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ser_manos/src/features/volunteer/interfaces/volunteering_repository.dart';
import 'package:ser_manos/src/features/volunteer/models/volunteering.dart';

class VolunteeringRepositoryImpl implements VolunteeringRepository {
  const VolunteeringRepositoryImpl({required this.store});
  final FirebaseFirestore store;
  static const String collectionName = 'volunteerings';

  Query<Volunteering> queryVolunteerings() =>
      store.collection(collectionName).withConverter<Volunteering>(
            fromFirestore: (snapshot, _) =>
                Volunteering.fromJson(snapshot.data()!),
            toFirestore: (volunteering, _) => volunteering.toJson(),
          );

  @override
  Future<List<Volunteering>> getVolunteerings() async {
    final volunteerings = await queryVolunteerings().get();
    return volunteerings.docs.map((doc) => doc.data()).toList();
  }

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
  Stream<int> getVacanciesStreamById(String id) {
    final collection = store.collection(collectionName);
    final document = collection.doc(id);
    return document.snapshots().map(
          (snapshot) => Volunteering.fromJson(snapshot.data()!).vacancies,
        );
  }
}