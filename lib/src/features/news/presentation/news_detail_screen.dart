import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ser_manos/src/core/providers/firebase_provider.dart';
import 'package:ser_manos/src/core/theme/colors.dart';
import 'package:ser_manos/src/features/news/providers/news_provider.dart';
import 'package:ser_manos/src/design-system/cells/headers/header.dart';
import 'package:ser_manos/src/design-system/molecules/buttons/button.dart';
import 'package:ser_manos/src/design-system/tokens/fill.dart';
import 'package:ser_manos/src/design-system/tokens/gap.dart';
import 'package:ser_manos/src/design-system/tokens/grid.dart';
import 'package:ser_manos/src/design-system/tokens/typography.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewsDetailScreen extends HookConsumerWidget {
  const NewsDetailScreen({super.key, required this.id});
  static const String route = '/home/news/:id';
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsDetail = ref.watch(newsDetailProvider(id));
    final isLoading = useState(false);
    final isSharingEnabled = useState(true);

    ref
        .watch(remoteConfigProvider)
        .whenData((rc) => isSharingEnabled.value = rc.enableNewsSharing);

    Future<XFile> getImageFileFromUrl(String url) async {
      var response = await http.get(Uri.parse(url));
      final documentDirectory = (await getApplicationDocumentsDirectory()).path;
      File file = File(
          '$documentDirectory/${DateTime.now().millisecondsSinceEpoch}.png');
      file.writeAsBytesSync(response.bodyBytes);
      return XFile(file.path);
    }

    return Scaffold(
      appBar: SMHeader.section(subtitle: AppLocalizations.of(context)!.news),
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
                    if (isSharingEnabled.value)
                      Align(
                        alignment: Alignment.center,
                        child: SMTypography.headline02(AppLocalizations.of(context)!.shareNews),
                      ),
                    const SMGap.vertical(height: 16),
                    if (isSharingEnabled.value)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 32),
                        child: SMFill.horizontal(
                          child: SMButton.filled(
                            AppLocalizations.of(context)!.share,
                            onPressed: () async {
                              isLoading.value = true;
                              final img =
                                  await getImageFileFromUrl(news.imageUrl);
                              Share.shareXFiles(
                                [img],
                                text: news.summary,
                              );
                              isLoading.value = false;
                            },
                            disabled: isLoading.value,
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
