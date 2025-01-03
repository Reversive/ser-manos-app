import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ser_manos/src/features/auth/presentation/base_screen.dart';
import 'package:ser_manos/src/features/volunteer/presentation/volunteer_screen.dart';
import 'package:ser_manos/src/design-system/atoms/logo.dart';
import 'package:ser_manos/src/design-system/molecules/buttons/button.dart';
import 'package:ser_manos/src/design-system/tokens/fill.dart';
import 'package:ser_manos/src/design-system/tokens/gap.dart';
import 'package:ser_manos/src/design-system/tokens/typography.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WelcomeScreen extends StatelessWidget {
  static const String route = "/welcome";
  static const String routeName = "Welcome";
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      content: [
        const Spacer(),
        Column(
          children: [
            const SquaredLogo(),
            const SMGap.vertical(
              height: 32,
            ),
            SMTypography.headline01(AppLocalizations.of(context)!.welcome),
            const SMGap.vertical(
              height: 48,
            ),
            SMTypography.subtitle01(
              AppLocalizations.of(context)!.welcomePhrase,
              align: TextAlign.center,
            ),
          ],
        ),
        const Spacer(),
        SMFill.horizontal(
          child: SMButton.filled(
            AppLocalizations.of(context)!.begin,
            onPressed: () =>
                Beamer.of(context).beamToNamed(VolunteerScreen.route),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
