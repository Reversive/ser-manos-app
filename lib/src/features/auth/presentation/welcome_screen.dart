import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ser_manos/src/features/auth/presentation/base_screen.dart';
import 'package:ser_manos/src/features/volunteer/presentation/volunteer_screen.dart';
import 'package:ser_manos/src/shared/atoms/logo.dart';
import 'package:ser_manos/src/shared/molecules/buttons/button.dart';
import 'package:ser_manos/src/shared/tokens/fill.dart';
import 'package:ser_manos/src/shared/tokens/gap.dart';
import 'package:ser_manos/src/shared/tokens/typography.dart';

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
            SMTypography.headline01("¡Bienvenido!"),
            const SMGap.vertical(
              height: 48,
            ),
            SMTypography.subtitle01(
              "Nunca subestimes tu habilidad para mejorar la vida de alguien.",
              align: TextAlign.center,
            ),
          ],
        ),
        const Spacer(),
        SMFill.horizontal(
          child: SMButton.filled(
            "Comenzar",
            onPressed: () =>
                Beamer.of(context).beamToNamed(VolunteerScreen.route),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
