import 'package:flutter/material.dart';
import 'package:ser_manos/src/features/auth/presentation/base_page.dart';
import 'package:ser_manos/src/shared/atoms/logo.dart';
import 'package:ser_manos/src/shared/molecules/buttons/button.dart';
import 'package:ser_manos/src/shared/tokens/gap.dart';
import 'package:ser_manos/src/shared/tokens/typography.dart';

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
          const SMGap.vertical(height: 32),
          SMTypography.subtitle01(
            "“El esfuerzo desinteresado para llevar alegría a los demás será el comienzo de una vida más feliz para nosotros”",
          ),
        ],
      ),
      const Spacer(),
      Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: SMButton.filled(
              "Iniciar Sesión",
              onPressed: () => print("TODO"),
            ),
          ),
          const SMGap.vertical(
            height: 16,
          ),
          SizedBox(
            width: double.infinity,
            child: SMButton.text(
              "Registrarse",
              onPressed: () => print("TODO"),
            ),
          ),
          const SMGap.vertical(
            height: 32,
          ),
        ],
      )
    ]);
  }
}
