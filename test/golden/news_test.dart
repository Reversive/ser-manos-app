import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import "package:flutter_localizations/flutter_localizations.dart";
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ser_manos/src/features/news/presentation/news_screen.dart';
import 'package:ser_manos/src/features/news/providers/news_provider.dart';

import 'mocks/news.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group(
    "News golden:::",
    () {
      testGoldens(
        'news list is empty',
        (test) async {
          await test.pumpWidget(
            Localizations(
              locale: const Locale('en'),
              delegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              child: ProviderScope(
                overrides: [
                  newsListProvider.overrideWith((ref) => newsEmptyListMock(ref))
                ],
                child: const Material(
                  child: NewsScreen(),
                ),
              ),
            ),
          );
          await screenMatchesGolden(test, 'news_list_empty');
        },
        tags: ['golden', 'news'],
      );
    },
  );
}
