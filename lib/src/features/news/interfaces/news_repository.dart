import 'package:ser_manos/src/features/news/models/news.dart';

abstract interface class NewsRepository {
  Stream<List<News>> getNews();
  Future<News> getNewsById(String id);
}