import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ser_manos/src/features/auth/presentation/base_screen.dart';
import 'package:ser_manos/src/features/auth/presentation/sign_in_screen.dart';
import 'package:ser_manos/src/features/auth/presentation/sign_up_screen.dart';
import 'package:ser_manos/src/design-system/atoms/logo.dart';
import 'package:ser_manos/src/design-system/molecules/buttons/button.dart';
import 'package:ser_manos/src/design-system/tokens/fill.dart';
import 'package:ser_manos/src/design-system/tokens/gap.dart';
import 'package:ser_manos/src/design-system/tokens/typography.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashScreen extends HookConsumerWidget {
  static const String route = "/splash";
  static const String routeName = "Splash";
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return BaseScreen(
      content: [
        const Spacer(),
        Column(
          children: [
            const SquaredLogo(),
            const SMGap.vertical(height: 32),
            SMTypography.subtitle01(
              AppLocalizations.of(context)!.splashPhrase,
              align: TextAlign.center,
            ),
          ],
        ),
        const Spacer(),
        Column(
          children: [
            SMFill.horizontal(
              child: SMButton.filled(
                AppLocalizations.of(context)!.login,
                onPressed: () =>
                    Beamer.of(context).beamToNamed(SignInScreen.route),
              ),
            ),
            const SMGap.vertical(
              height: 16,
            ),
            SMFill.horizontal(
              child: SMButton.text(
                AppLocalizations.of(context)!.register,
                onPressed: () =>
                    Beamer.of(context).beamToNamed(SignUpScreen.route),
              ),
            ),
            const SMGap.vertical(
              height: 32,
            ),
          ],
        )
      ],
    );
  }
}
