import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ser_manos/src/core/theme/colors.dart';
import 'package:ser_manos/src/features/auth/controllers/auth_controller.dart';
import 'package:ser_manos/src/features/auth/models/information.dart';
import 'package:ser_manos/src/features/auth/presentation/splash_screen.dart';
import 'package:ser_manos/src/features/profile/presentation/edit_profile_screen.dart';
import 'package:ser_manos/src/design-system/cells/cards/card.dart';
import 'package:ser_manos/src/design-system/molecules/buttons/button.dart';
import 'package:ser_manos/src/design-system/molecules/components/component.dart';
import 'package:ser_manos/src/design-system/tokens/fill.dart';
import 'package:ser_manos/src/design-system/tokens/gap.dart';
import 'package:ser_manos/src/design-system/tokens/grid.dart';
import 'package:ser_manos/src/design-system/tokens/typography.dart';

class CompleteProfileScreen extends HookConsumerWidget {
  const CompleteProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.read(authControllerProvider.notifier);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: SMGrid(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SMComponent.profilePictureBig(
                image: const NetworkImage(
                  "https://pbs.twimg.com/media/FjU2lkcWYAgNG6d.jpg",
                ),
              ),
              const SMGap.vertical(height: 16),
              SMTypography.overline(
                "VOLUNTARIO",
                color: SMColors.neutral75,
              ),
              const SMGap.vertical(height: 2),
              SMTypography.subtitle01("Juan Cruz Gonzalez"),
              const SMGap.vertical(height: 2),
              SMTypography.body01(
                "mimail@mail.com",
                color: SMColors.secondary200,
              ),
              const SMGap.vertical(height: 32),
              SMCard.information(
                information: Information(
                  title: "Información personal",
                  label1: "Fecha de nacimiento",
                  content1: "10/08/1990",
                  label2: "Género",
                  content2: "Hombre",
                ),
              ),
              const SMGap.vertical(height: 32),
              SMCard.information(
                information: Information(
                  title: "Datos de contacto",
                  label1: "Teléfono",
                  content1: "+5491141625944",
                  label2: "E-mail",
                  content2: "mimail@mail.com",
                ),
              ),
              const SMGap.vertical(height: 32),
              SMFill.horizontal(
                child: SMButton.filled(
                  "Editar perfil",
                  onPressed: () => Beamer.of(context).beamToNamed(
                    EditProfileScreen.route,
                    beamBackOnPop: true,
                  ),
                ),
              ),
              const SMGap.vertical(height: 8),
              SMFill.horizontal(
                child: SMButton.text("Cerrar sesión", color: SMColors.error100,
                    onPressed: () {
                  authController.signOut();
                  Beamer.of(context).beamToNamed(SplashScreen.route);
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
