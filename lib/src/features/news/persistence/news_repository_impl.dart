import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ser_manos/src/features/news/interfaces/news_repository.dart';
import 'package:ser_manos/src/features/news/models/news.dart';

class NewsRepositoryImpl implements NewsRepository {
  const NewsRepositoryImpl({required this.source});
  final FirebaseFirestore source;
  static const String collectionName = 'news';

  Query<News> queryNews() =>
      source.collection(collectionName).withConverter<News>(
            fromFirestore: (snapshot, _) => News.fromJson(snapshot.data()!),
            toFirestore: (news, _) => news.toJson(),
          );

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
  Future<List<News>> getNews() async {
    final news = await queryNews().get();
    return news.docs.map((doc) => doc.data()).toList();
  }
}
