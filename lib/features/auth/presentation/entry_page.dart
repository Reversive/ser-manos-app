import 'package:flutter/material.dart';
import 'package:ser_manos/features/auth/presentation/base_page.dart';
import 'package:ser_manos/shared/atoms/logo.dart';
import 'package:ser_manos/shared/molecules/buttons/b_cta_filled.dart';
import 'package:ser_manos/shared/molecules/buttons/b_cta_text.dart';
import 'package:ser_manos/shared/tokens/typographies/t_subtitle01.dart';

class EntryPage extends StatelessWidget {
  const EntryPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BasePage(content: [
      const Spacer(),
      Column(
        children: [
          const SquaredLogo(),
          const SizedBox(height: 32),
          TSubtitle1(
            "“El esfuerzo desinteresado para llevar alegría a los demás será el comienzo de una vida más feliz para nosotros”",
          ),
        ],
      ),
      const Spacer(),
      Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: BCtaFilled(
              "Iniciar Sesión",
              onPressed: () => print("TODO"),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: double.infinity,
            child: BCtaText(
              "Registrarse",
              onPressed: () => print("TODO"),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
        ],
      )
    ]);
  }
}
