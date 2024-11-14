import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ser_manos/src/core/theme/colors.dart';
import 'package:ser_manos/src/design-system/cells/modals/modal.dart';
import 'package:ser_manos/src/features/auth/controllers/auth_controller.dart';
import 'package:ser_manos/src/features/auth/presentation/splash_screen.dart';
import 'package:ser_manos/src/features/auth/providers/auth_provider.dart';
import 'package:ser_manos/src/features/profile/presentation/edit_profile_screen.dart';
import 'package:ser_manos/src/design-system/atoms/icon.dart';
import 'package:ser_manos/src/design-system/molecules/buttons/button.dart';
import 'package:ser_manos/src/design-system/tokens/fill.dart';
import 'package:ser_manos/src/design-system/tokens/gap.dart';
import 'package:ser_manos/src/design-system/tokens/grid.dart';
import 'package:ser_manos/src/design-system/tokens/typography.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashProfileScreen extends HookConsumerWidget {
  const SplashProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.read(authControllerProvider.notifier);
    final currentUser = ref.watch(currentUserProvider);

    return currentUser.when(
      data: (user) => SMGrid(
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
              AppLocalizations.of(context)!.volunteer,
              color: SMColors.neutral75,
            ),
            const SMGap.vertical(height: 8),
            SMTypography.subtitle01('${user.name} ${user.surname}'),
            const SMGap.vertical(height: 8),
            SMTypography.body01(
              AppLocalizations.of(context)!.completeProfile,
              align: TextAlign.center,
              color: SMColors.neutral75,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SMButton.short(
                  AppLocalizations.of(context)!.complete,
                  icon: const SMIcon(
                    icon: Icons.add,
                    active: true,
                    activeColor: SMColors.neutral0,
                  ),
                  onPressed: () => Beamer.of(context).beamToNamed(
                    EditProfileScreen.route,
                    beamBackOnPop: true,
                  ),
                ),
              ],
            ),
            const SMGap.vertical(height: 10),
            SMFill.horizontal(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 26),
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
            ),
          ],
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
