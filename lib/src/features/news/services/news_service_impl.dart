import 'package:ser_manos/src/features/news/interfaces/news_repository.dart';
import 'package:ser_manos/src/features/news/interfaces/news_service.dart';
import 'package:ser_manos/src/features/news/models/news.dart';

class NewsServiceImpl implements NewsService {
  const NewsServiceImpl({required this.repository});
  final NewsRepository repository;

  @override
  Future<List<News>> getNews() async {
    final news = await repository.getNews();
    news.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return news;
  }

  @override
  Future<News> getNewsById(String id) {
    return repository.getNewsById(id);
  }
}
