import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:ser_manos/src/features/auth/presentation/sign_in_screen.dart';
import 'package:ser_manos/src/features/auth/presentation/sign_up_screen.dart';
import "package:flutter_localizations/flutter_localizations.dart";
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  group('Auth golden:::', () {
    testGoldens('sign in page', (test) async {
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
            child: Center(
              child: SignInScreen(),
            ),
          ),
        ),
      );
      await screenMatchesGolden(test, 'sign_in_page');
    }, tags: ['golden', 'auth']);

    testGoldens('sign up page', (test) async {
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
            child: Center(
              child: SignUpScreen(),
            ),
          ),
        ),
      );
      await screenMatchesGolden(test, 'sign_up_page');
    }, tags: ['golden', 'auth']);
  });
}
