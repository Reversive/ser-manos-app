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
  Future<List<Volunteering>> getVolunteerings(String? search) async {
    final volunteerings = await queryVolunteerings().get();
    search = search?.toLowerCase();
    return volunteerings.docs
        .map((document) => document.data())
        .where((volunteering) =>
            search == null ||
            volunteering.name.toLowerCase().contains(search) ||
            volunteering.about.toLowerCase().contains(search) ||
            volunteering.purpose.toLowerCase().contains(search))
        .toList();
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

  @override
  Future<void> applyToVolunteering(String uuid, String volunteeringId) {
    final collection = store.collection(collectionName);
    return collection.doc(volunteeringId).update({
      'postulations': FieldValue.arrayUnion([uuid]),
      'vacancies': FieldValue.increment(-1),
    });
  }

  @override
  Future<void> cancelApplicationToVolunteering(
      String uuid, String volunteeringId) {
    final collection = store.collection(collectionName);
    return collection.doc(volunteeringId).update({
      'vacancies': FieldValue.increment(1),
      'postulations': FieldValue.arrayRemove([uuid]),
    });
  }

  @override
  Future<void> abandonVolunteering(String uuid, String volunteeringId) {
    final collection = store.collection(collectionName);
    return collection.doc(volunteeringId).update({
      'vacancies': FieldValue.increment(1),
      'members': FieldValue.arrayRemove([uuid]),
    });
  }

  @override
  Stream<bool> isPostulatedOrVolunteering(String uuid) {
    final collection = store.collection(collectionName);
    return collection.snapshots().map((snapshot) {
      for (final document in snapshot.docs) {
        final volunteering = Volunteering.fromJson(document.data());
        if (volunteering.postulations.contains(uuid) ||
            volunteering.members.contains(uuid)) {
          return true;
        }
      }
      return false;
    });
  }

  @override
  Stream<bool> isPostulated(String uuid, String volunteeringId) {
    final collection = store.collection(collectionName);
    return collection.doc(volunteeringId).snapshots().map((snapshot) {
      final volunteering = Volunteering.fromJson(snapshot.data()!);
      return volunteering.postulations.contains(uuid);
    });
  }

  @override
  Stream<bool> isVolunteering(String uuid, String volunteeringId) {
    final collection = store.collection(collectionName);
    return collection.doc(volunteeringId).snapshots().map((snapshot) {
      final volunteering = Volunteering.fromJson(snapshot.data()!);
      return volunteering.members.contains(uuid);
    });
  }

  @override
  Future<void> abandonCurrentVolunteering(String uuid) {
    final collection = store.collection(collectionName);
    return collection.get().then((snapshot) {
      for (final document in snapshot.docs) {
        final volunteering = Volunteering.fromJson(document.data());
        if (volunteering.members.contains(uuid) ||
            volunteering.postulations.contains(uuid)) {
          return collection.doc(document.id).update({
            'members': FieldValue.arrayRemove([uuid]),
            'postulations': FieldValue.arrayRemove([uuid]),
            'vacancies': FieldValue.increment(1),
          });
        }
      }
    });
  }
}
