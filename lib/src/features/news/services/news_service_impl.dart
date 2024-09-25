import 'package:ser_manos/src/features/news/interfaces/news_repository.dart';
import 'package:ser_manos/src/features/news/interfaces/news_service.dart';
import 'package:ser_manos/src/features/news/models/news.dart';

class NewsServiceImpl implements NewsService {
  const NewsServiceImpl({required this.repository});
  final NewsRepository repository;

  @override
  Future<List<News>> getNews() {
    return repository.getNews();
  }

  @override
  Future<News> getNewsById(String id) {
    return repository.getNewsById(id);
  }
}