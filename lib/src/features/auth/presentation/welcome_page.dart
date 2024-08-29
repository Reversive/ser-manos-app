import 'package:flutter/material.dart';
import 'package:ser_manos/src/features/auth/presentation/base_page.dart';
import 'package:ser_manos/src/shared/atoms/logo.dart';
import 'package:ser_manos/src/shared/molecules/buttons/button.dart';
import 'package:ser_manos/src/shared/tokens/gap.dart';
import 'package:ser_manos/src/shared/tokens/typography.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
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
        SizedBox(
          width: double.infinity,
          child: SMButton.filled(
            "Comenzar",
            onPressed: () => print("TODO"),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
