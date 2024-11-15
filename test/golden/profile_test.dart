import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import "package:flutter_localizations/flutter_localizations.dart";
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:ser_manos/src/features/auth/providers/auth_provider.dart';
import 'package:ser_manos/src/features/profile/presentation/complete_profile_screen.dart';
import 'package:ser_manos/src/features/profile/presentation/splash_profile_screen.dart';

import 'mocks/user.dart';

void main() {
  group('Profile golden:::', () {
    testGoldens('complete profile page', (test) async {
      mockNetworkImagesFor(
        () async => await test.pumpWidgetBuilder(
          ProviderScope(
            overrides: [
              currentUserProvider
                  .overrideWith((ref) => currentUserProviderMock(ref)),
            ],
            child: Localizations(
              delegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              locale: const Locale('en'),
              child: const Center(
                child: CompleteProfileScreen(),
              ),
            ),
          ),
        ),
      );

      await screenMatchesGolden(test, 'profile_page_complete');
    }, tags: ['golden', 'profile']);

    testGoldens('incomplete profile page', (test) async {
      mockNetworkImagesFor(
        () async => await test.pumpWidgetBuilder(
          ProviderScope(
            overrides: [
              currentUserProvider.overrideWith(
                  (ref) => currentUserIncompleteProviderMock(ref)),
            ],
            child: Localizations(
              delegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              locale: const Locale('en'),
              child: const Center(
                child: SplashProfileScreen(),
              ),
            ),
          ),
        ),
      );

      await screenMatchesGolden(test, 'profile_page_incomplete');
    }, tags: ['golden', 'profile']);
  });
}
