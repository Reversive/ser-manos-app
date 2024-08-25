import 'package:flutter/material.dart';
import 'package:ser_manos/features/auth/presentation/base_page.dart';
import 'package:ser_manos/shared/atoms/logo.dart';
import 'package:ser_manos/shared/molecules/buttons/b_cta_filled.dart';
import 'package:ser_manos/shared/tokens/typographies/t_headline01.dart';
import 'package:ser_manos/shared/tokens/typographies/t_subtitle01.dart';

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
            const SizedBox(
              height: 32,
            ),
            THeadline1("¡Bienvenido!"),
            const SizedBox(height: 48),
            TSubtitle1(
              "Nunca subestimes tu habilidad para mejorar la vida de alguien.",
              textAlign: TextAlign.center,
            ),
          ],
        ),
        const Spacer(),
        SizedBox(
          width: double.infinity,
          child: BCtaFilled(
            "Comenzar",
            onPressed: () => print("TODO"),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
