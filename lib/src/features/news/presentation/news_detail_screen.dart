import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ser_manos/src/core/theme/colors.dart';
import 'package:ser_manos/src/features/news/providers/news_provider.dart';
import 'package:ser_manos/src/shared/cells/headers/header.dart';
import 'package:ser_manos/src/shared/molecules/buttons/button.dart';
import 'package:ser_manos/src/shared/tokens/fill.dart';
import 'package:ser_manos/src/shared/tokens/gap.dart';
import 'package:ser_manos/src/shared/tokens/grid.dart';
import 'package:ser_manos/src/shared/tokens/typography.dart';

class NewsDetailScreen extends HookConsumerWidget {
  const NewsDetailScreen({super.key, required this.id});
  static const String route = '/home/news/:id';
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsDetail = ref.watch(newsDetailProvider(id));

    return Scaffold(
      appBar: SMHeader.section(subtitle: "Novedades"),
      backgroundColor: SMColors.neutral0,
      body: newsDetail.when(
        data: (news) => RefreshIndicator(
          onRefresh: () async => ref.refresh(newsDetailProvider(id)),
          color: SMColors.primary100,
          child: Padding(
            padding: const EdgeInsets.only(top: 24),
            child: SMGrid(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SMTypography.overline(
                      news.source.toUpperCase(),
                      color: SMColors.neutral75,
                    ),
                    SMTypography.headline02(news.title),
                    const SMGap.vertical(height: 16),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        news.imageUrl,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    const SMGap.vertical(height: 16),
                    SMTypography.subtitle01(
                      news.summary,
                      color: SMColors.secondary200,
                    ),
                    const SMGap.vertical(height: 16),
                    SMTypography.body01(news.content),
                    const SMGap.vertical(height: 16),
                    Align(
                      alignment: Alignment.center,
                      child: SMTypography.headline02("Comparte esta nota"),
                    ),
                    const SMGap.vertical(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 32),
                      child: SMFill.horizontal(
                        child: SMButton.filled(
                          "Compartir",
                          onPressed: () {
                            // TODO: implement share functionality
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        error: (e, _) => Center(
          child: SMTypography.body01(
            'Error: $e',
            color: SMColors.error100,
          ),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
