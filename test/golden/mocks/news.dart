import 'dart:async';

import 'package:ser_manos/src/features/news/models/news.dart';

FutureOr<List<News>> newsEmptyListMock(ref) {
  return Future.value([]);
}

FutureOr<List<News>> newsNotEmptyListMock(ref) {
  return Future.value(
    [
      const News(
        id: '1',
        imageUrl: '',
        source: '',
        title: '',
        summary: '',
        content: '',
        createdAt: 100,
      ),
    ],
  );
}
