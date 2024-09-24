import 'package:ser_manos/src/features/news/models/news.dart';

abstract interface class NewsService {
  Stream<List<News>> getNews();
  Future<News> getNewsById(String id);
}