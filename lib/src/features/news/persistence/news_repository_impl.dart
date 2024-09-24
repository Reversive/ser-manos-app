import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ser_manos/src/features/news/interfaces/news_repository.dart';
import 'package:ser_manos/src/features/news/models/news.dart';

class NewsRepositoryImpl implements NewsRepository {
  const NewsRepositoryImpl({required this.source});
  final FirebaseFirestore source;

  static const String collectionName = 'news';

  @override
  Future<News> getNewsById(String id) async {
    final collection = source.collection(collectionName);
    final document = await collection.doc(id).get();
    if (document.exists) {
      return News.fromJson(document.data()!);
    }
    throw Exception('News not found');
  }

  @override
  Stream<List<News>> getNews() {
    final snapshot = source.collection(collectionName).snapshots();

    return snapshot.map(
      (query) => [
        for (final item in query.docs) News.fromJson(item.data()),
      ],
    );
  }
}
