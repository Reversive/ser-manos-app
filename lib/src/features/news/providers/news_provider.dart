import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/src/core/providers/firebase_provider.dart';
import 'package:ser_manos/src/features/news/interfaces/news_repository.dart';
import 'package:ser_manos/src/features/news/interfaces/news_service.dart';
import 'package:ser_manos/src/features/news/models/news.dart';
import 'package:ser_manos/src/features/news/persistence/news_repository_impl.dart';
import 'package:ser_manos/src/features/news/services/news_service_impl.dart';
part 'news_provider.g.dart';

@Riverpod(keepAlive: true)
NewsRepository newsRepository(NewsRepositoryRef ref) {
  return NewsRepositoryImpl(source: ref.watch(firebaseFirestoreProvider));
}

@Riverpod(keepAlive: true)
NewsService newsService(NewsServiceRef ref) {
  return NewsServiceImpl(repository: ref.watch(newsRepositoryProvider));
}

@riverpod
Future<List<News>> newsList(NewsListRef ref) {
  return ref.watch(newsServiceProvider).getNews();
}

@riverpod
Future<News> newsDetail(NewsDetailRef ref, String id) {
  return ref.watch(newsServiceProvider).getNewsById(id);
}