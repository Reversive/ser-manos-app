import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ser_manos/src/core/theme/colors.dart';
import 'package:ser_manos/src/features/news/providers/news_provider.dart';
import 'package:ser_manos/src/shared/cells/cards/card.dart';
import 'package:ser_manos/src/shared/tokens/gap.dart';
import 'package:ser_manos/src/shared/tokens/grid.dart';
import 'package:ser_manos/src/shared/tokens/typography.dart';

class NewsScreen extends HookConsumerWidget {
  static const String route = '/home/news';
  static const String routeName = 'news';
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsList = ref.watch(newsListProvider);
    return newsList.when(
      data: (news) => Material(
        color: SMColors.secondary10,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 16,
          ),
          child: SMGrid(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return SMCard.news(
                  news: news[index],
                  onPressed: () => Beamer.of(context).beamToNamed(
                    "${NewsScreen.route}?id=$index",
                    beamBackOnPop: true,
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  const SMGap.vertical(height: 24),
              itemCount: news.length,
            ),
          ),
        ),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, _) => Center(
        child: SMTypography.body01(
          'Error: $error',
          color: SMColors.error100,
        ),
      ),
    );
  }
}
