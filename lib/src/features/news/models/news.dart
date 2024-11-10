import 'package:freezed_annotation/freezed_annotation.dart';
part 'generated/news.freezed.dart';
part 'generated/news.g.dart';

@freezed
class News with _$News {
  const factory News({
    required String id,
    required String imageUrl,
    required String source,
    required String title,
    required String summary,
    required String content,
    required double createdAt,
  }) = _News;

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
}
