import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ser_manos/src/core/theme/colors.dart';
import 'package:ser_manos/src/design-system/cells/modals/modal.dart';
import 'package:ser_manos/src/features/auth/controllers/auth_controller.dart';
import 'package:ser_manos/src/features/auth/models/information.dart';
import 'package:ser_manos/src/features/auth/presentation/splash_screen.dart';
import 'package:ser_manos/src/features/auth/providers/auth_provider.dart';
import 'package:ser_manos/src/features/profile/presentation/edit_profile_screen.dart';
import 'package:ser_manos/src/design-system/cells/cards/card.dart';
import 'package:ser_manos/src/design-system/molecules/buttons/button.dart';
import 'package:ser_manos/src/design-system/molecules/components/component.dart';
import 'package:ser_manos/src/design-system/tokens/fill.dart';
import 'package:ser_manos/src/design-system/tokens/gap.dart';
import 'package:ser_manos/src/design-system/tokens/grid.dart';
import 'package:ser_manos/src/design-system/tokens/typography.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class CompleteProfileScreen extends HookConsumerWidget {
  const CompleteProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.read(authControllerProvider.notifier);
    final currentUser = ref.watch(currentUserProvider);
    return currentUser.when(
      data: (userData) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: SMGrid(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SMComponent.profilePictureBig(
                  image: NetworkImage(
                    userData.image!,
                  ),
                ),
                const SMGap.vertical(height: 16),
                SMTypography.overline(
                  AppLocalizations.of(context)!.volunteer,
                  color: SMColors.neutral75,
                ),
                const SMGap.vertical(height: 2),
                SMTypography.subtitle01('${userData.name} ${userData.surname}'),
                const SMGap.vertical(height: 2),
                SMTypography.body01(
                  userData.email!,
                  color: SMColors.secondary200,
                ),
                const SMGap.vertical(height: 32),
                SMCard.information(
                  information: Information(
                    title: AppLocalizations.of(context)!.personalInfo,
                    label1: AppLocalizations.of(context)!.dateOfBirth,
                    content1: "10/08/1990",
                    label2: AppLocalizations.of(context)!.genre,
                    content2: userData.gender!.value,
                  ),
                ),
                const SMGap.vertical(height: 32),
                SMCard.information(
                  information: Information(
                    title: AppLocalizations.of(context)!.contactDetails,
                    label1: AppLocalizations.of(context)!.phone,
                    content1: userData.phone!,
                    label2: AppLocalizations.of(context)!.email,
                    content2: userData.email!,
                  ),
                ),
                const SMGap.vertical(height: 32),
                SMFill.horizontal(
                  child: SMButton.filled(
                    AppLocalizations.of(context)!.editProfile,
                    onPressed: () => Beamer.of(context).beamToNamed(
                      EditProfileScreen.route,
                      beamBackOnPop: true,
                    ),
                  ),
                ),
                const SMGap.vertical(height: 8),
                SMFill.horizontal(
                  child: SMButton.text(
                    AppLocalizations.of(context)!.signOut,
                    color: SMColors.error100,
                    onPressed: () => showDialog(
                      context: context,
                      builder: (BuildContext ctx) => SMModal(
                        title: AppLocalizations.of(context)!.signOutPrompt,
                        cancelText: AppLocalizations.of(context)!.cancel,
                        confirmText: AppLocalizations.of(context)!.signOut,
                        context: context,
                        onConfirm: () {
                          authController.signOut();
                          Beamer.of(context).beamToNamed(SplashScreen.route);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      error: (e, _) => Center(
        child: SMTypography.body01(
          'Error: $e',
          color: SMColors.error100,
        ),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
