import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:ser_manos/src/features/auth/presentation/splash_screen.dart';
import 'package:ser_manos/src/features/auth/presentation/welcome_screen.dart';
import "package:flutter_localizations/flutter_localizations.dart";
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  group('Entry golden:::', () {
    testGoldens(
      'splash page',
      (test) async {
        await test.pumpWidgetBuilder(
          ProviderScope(
            child: Localizations(
              delegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              locale: const Locale('en'),
              child: const Center(
                child: SplashScreen(),
              ),
            ),
          ),
        );
        await screenMatchesGolden(test, 'splash_page');
      },
      tags: ['golden', 'entry'],
    );

    testGoldens(
      'welcome page',
      (test) async {
        await test.pumpWidgetBuilder(
          ProviderScope(
            child: Localizations(
              delegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              locale: const Locale('en'),
              child: const Center(
                child: WelcomeScreen(),
              ),
            ),
          ),
        );
        await screenMatchesGolden(test, 'welcome_page');
      },
      tags: ['golden', 'entry'],
    );
  });
}
