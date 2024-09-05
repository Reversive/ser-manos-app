import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ser_manos/src/core/theme/colors.dart';
import 'package:ser_manos/src/features/auth/presentation/splash_screen.dart';
import 'package:ser_manos/src/features/profile/presentation/edit_profile_screen.dart';
import 'package:ser_manos/src/shared/atoms/icon.dart';
import 'package:ser_manos/src/shared/molecules/buttons/button.dart';
import 'package:ser_manos/src/shared/tokens/fill.dart';
import 'package:ser_manos/src/shared/tokens/gap.dart';
import 'package:ser_manos/src/shared/tokens/grid.dart';
import 'package:ser_manos/src/shared/tokens/typography.dart';

class SplashProfileScreen extends StatelessWidget {
  const SplashProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SMGrid(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          const Icon(
            Icons.account_circle,
            size: 100,
            color: SMColors.secondary100,
          ),
          const SMGap.vertical(height: 16),
          SMTypography.overline(
            "VOLUNTARIO",
            color: SMColors.neutral75,
          ),
          const SMGap.vertical(height: 8),
          SMTypography.subtitle01("Juan Cruz Gonzalez"),
          const SMGap.vertical(height: 8),
          SMTypography.body01(
            "¡Completá tu perfil para tener acceso a mejores oportunidades!",
            align: TextAlign.center,
            color: SMColors.neutral75,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SMButton.short(
                "Completar",
                icon: const SMIcon(
                  icon: Icons.add,
                  active: true,
                  activeColor: SMColors.neutral0,
                ),
                onPressed: () => Beamer.of(context).beamToNamed(
                  EditProfileScreen.route,
                ), // route to edit profile screen
              ),
            ],
          ),
          const SMGap.vertical(height: 10),
          SMFill.horizontal(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 26),
              child: SMButton.text(
                "Cerrar sesión",
                color: SMColors.error100,
                onPressed: () => Beamer.of(context)
                    .beamToNamed(SplashScreen.route) // TODO: Logout
                ,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
