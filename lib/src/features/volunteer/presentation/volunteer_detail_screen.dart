import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ser_manos/src/core/providers/firebase_provider.dart';
import 'package:ser_manos/src/core/theme/colors.dart';
import 'package:ser_manos/src/design-system/cells/modals/modal.dart';
import 'package:ser_manos/src/design-system/molecules/buttons/button.dart';
import 'package:ser_manos/src/features/auth/providers/auth_provider.dart';
import 'package:ser_manos/src/features/auth/providers/user_provider.dart';
import 'package:ser_manos/src/features/profile/presentation/edit_profile_screen.dart';
import 'package:ser_manos/src/features/volunteer/providers/volunteering_provider.dart';
import 'package:ser_manos/src/design-system/cells/cards/card.dart';
import 'package:ser_manos/src/design-system/cells/headers/header.dart';
import 'package:ser_manos/src/design-system/molecules/components/component.dart';
import 'package:ser_manos/src/design-system/tokens/fill.dart';
import 'package:ser_manos/src/design-system/tokens/gap.dart';
import 'package:ser_manos/src/design-system/tokens/grid.dart';
import 'package:ser_manos/src/design-system/tokens/typography.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VolunteerDetailScreen extends HookConsumerWidget {
  const VolunteerDetailScreen({super.key, required this.id});
  static const String route = '/home/volunteers/:id';

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final volunteeringDetail = ref.watch(volunteeringDetailProvider(id));
    final shouldDisable = useState(false);

    final uuid = useState('');
    ref.watch(currentUserProvider).whenData((u) => uuid.value = u.uuid);

    final isPostulatedOrVolunteering = ref
        .watch(volunteeringIsPostulatedOrVolunteeringProvider(uuid.value))
        .when(
          data: (isPostulatedOrVolunteering) => isPostulatedOrVolunteering,
          error: (e, s) => false,
          loading: () => false,
        );

    final currentUser = ref.watch(currentUserProvider).when(
          data: (user) => user,
          error: (e, s) => null,
          loading: () => null,
        );

    final isPostulated =
        ref.watch(volunteeringIsPostulatedProvider(uuid.value, id)).when(
              data: (isPostulated) => isPostulated,
              error: (e, s) => false,
              loading: () => false,
            );

    final isVolunteering =
        ref.watch(volunteeringIsVolunteeringProvider(uuid.value, id)).when(
              data: (isVolunteering) => isVolunteering,
              error: (e, s) => false,
              loading: () => false,
            );

    final vacancies = ref.watch(volunteeringVacanciesProvider(id)).when(
          data: (vacancies) => vacancies,
          error: (e, s) => 0,
          loading: () => 0,
        );

    final analyticsService = ref.watch(analyticsServiceProvider);

    showFavoriteSnackbar(isRemoved) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: SMTypography.body01(
            AppLocalizations.of(context)!.volunteeringsFavoriteSnackbar(
                isRemoved
                    ? AppLocalizations.of(context)!.volunteeringsRemovedFrom
                    : AppLocalizations.of(context)!.volunteeringsAddedTo),
            color: SMColors.neutral0,
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: SMHeader.transparent(
        isFavorite: currentUser != null
            ? currentUser.favoriteVolunteerings.contains(id)
            : false,
        onPressed: () async {
          if (currentUser == null) return;
          if (currentUser.favoriteVolunteerings.contains(id)) {
            showFavoriteSnackbar(true);
            await ref.read(userRepositoryProvider).removeFavoriteVolunteering(
                  currentUser.uuid,
                  id,
                );
            await analyticsService.logVolunteeringUnfavorite(
              id,
            );
          } else {
            showFavoriteSnackbar(false);
            await ref.read(userRepositoryProvider).setFavoriteVolunteering(
                  currentUser.uuid,
                  id,
                );
            await analyticsService.logVolunteeringFavorite(
              id,
            );
          }
        },
      ),
      backgroundColor: SMColors.neutral0,
      body: volunteeringDetail.when(
        data: (volunteering) => RefreshIndicator(
          onRefresh: () async => ref.refresh(volunteeringDetailProvider(id)),
          color: SMColors.primary100,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SMFill.horizontal(
                  child: Image.network(
                    volunteering.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                SMGrid(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 24,
                      bottom: 32,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SMTypography.overline(
                          AppLocalizations.of(context)!.socialAction,
                          color: SMColors.neutral75,
                        ),
                        SMTypography.headline01(volunteering.name),
                        const SMGap.vertical(height: 16),
                        SMTypography.body01(
                          volunteering.purpose,
                          color: SMColors.secondary200,
                        ),
                        const SMGap.vertical(height: 24),
                        SMTypography.headline02(
                            AppLocalizations.of(context)!.aboutActivity),
                        const SMGap.vertical(height: 8),
                        SMTypography.body01(
                          volunteering.about,
                        ),
                        const SMGap.vertical(height: 24),
                        SMCard.location(
                          context: context,
                          hasEmbeddedMap: true,
                          location: volunteering.location,
                        ),
                        const SMGap.vertical(height: 32),
                        SMTypography.headline02(
                            AppLocalizations.of(context)!.applyToVolunteer),
                        const SMGap.vertical(height: 8),
                        SMTypography.subtitle01(
                            AppLocalizations.of(context)!.requirements),
                        const SMGap.vertical(height: 8),
                        SMComponent.bulletList(
                          items: volunteering.requirements,
                        ),
                        const SMGap.vertical(height: 8),
                        SMTypography.subtitle01(
                            AppLocalizations.of(context)!.availability),
                        const SMGap.vertical(height: 8),
                        SMComponent.bulletList(
                          items: volunteering.availability,
                        ),
                        const SMGap.vertical(height: 8),
                        SMComponent.vacancy(
                          vacancies: vacancies,
                          context: context,
                        ),
                        const SMGap.vertical(height: 24),
                        !isPostulatedOrVolunteering
                            ? Column(
                                children: [
                                  if (vacancies == 0)
                                    SMTypography.body01(
                                        AppLocalizations.of(context)!
                                            .noVacanciesAbailableToApply,
                                        align: TextAlign.center),
                                  if (vacancies == 0)
                                    const SMGap.vertical(height: 24),
                                  SMFill.horizontal(
                                    child: SMButton.filled(
                                      AppLocalizations.of(context)!.apply,
                                      disabled:
                                          vacancies == 0 || shouldDisable.value,
                                      onPressed: () => {
                                        if (!currentUser!.completed)
                                          {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext ctx) =>
                                                  SModalFlip(
                                                subtitle: AppLocalizations.of(
                                                        context)!
                                                    .applyConditionData,
                                                cancelText: AppLocalizations.of(
                                                        context)!
                                                    .cancel,
                                                confirmText: AppLocalizations
                                                        .of(context)!
                                                    .applyConditionDataButton,
                                                context: context,
                                                onConfirm: () =>
                                                    Beamer.of(context)
                                                        .beamToNamed(
                                                  EditProfileScreen.route,
                                                  data: {
                                                    'volunteeringIndex':
                                                        volunteering.id
                                                  },
                                                  beamBackOnPop: true,
                                                ),
                                              ),
                                            ),
                                          }
                                        else
                                          {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext ctx) =>
                                                  SModalFlip(
                                                title: volunteering.name,
                                                subtitle: AppLocalizations.of(
                                                        context)!
                                                    .aboutToVolunteer,
                                                cancelText: AppLocalizations.of(
                                                        context)!
                                                    .cancel,
                                                confirmText:
                                                    AppLocalizations.of(
                                                            context)!
                                                        .confirm,
                                                context: context,
                                                onConfirm: () async {
                                                  shouldDisable.value = true;
                                                  await ref
                                                      .watch(
                                                          volunteeringServiceProvider)
                                                      .applyToVolunteering(
                                                          volunteering.id);
                                                  shouldDisable.value = false;
                                                },
                                              ),
                                            ),
                                          },
                                      },
                                    ),
                                  ),
                                ],
                              )
                            : isPostulated
                                ? SMCard.volunteerPostulationDetails(
                                    title:
                                        AppLocalizations.of(context)!.applied,
                                    content: AppLocalizations.of(context)!
                                        .appliedMessage,
                                    btnText: AppLocalizations.of(context)!
                                        .removeApplication,
                                    shouldDisable: shouldDisable.value,
                                    onBtnPressed: () => showDialog(
                                      context: context,
                                      builder: (BuildContext ctx) => SModalFlip(
                                        title: volunteering.name,
                                        subtitle: AppLocalizations.of(context)!
                                            .removeApplicationPrompt,
                                        cancelText:
                                            AppLocalizations.of(context)!
                                                .cancel,
                                        confirmText:
                                            AppLocalizations.of(context)!
                                                .confirm,
                                        context: context,
                                        onConfirm: () async {
                                          shouldDisable.value = true;
                                          await ref
                                              .watch(
                                                  volunteeringServiceProvider)
                                              .cancelApplicationToVolunteering(
                                                  volunteering.id);
                                          shouldDisable.value = false;
                                        },
                                      ),
                                    ),
                                  )
                                : isVolunteering
                                    ? SMCard.volunteerPostulationDetails(
                                        title: AppLocalizations.of(context)!
                                            .participating,
                                        content: AppLocalizations.of(context)!
                                            .participationMessage,
                                        btnText: AppLocalizations.of(context)!
                                            .abandonVolunteering,
                                        shouldDisable: shouldDisable.value,
                                        onBtnPressed: () => showDialog(
                                          context: context,
                                          builder: (BuildContext ctx) =>
                                              SModalFlip(
                                            title: volunteering.name,
                                            subtitle:
                                                AppLocalizations.of(context)!
                                                    .abandonVolunteeringPrompt,
                                            cancelText:
                                                AppLocalizations.of(context)!
                                                    .cancel,
                                            confirmText:
                                                AppLocalizations.of(context)!
                                                    .confirm,
                                            context: context,
                                            onConfirm: () async {
                                              shouldDisable.value = true;
                                              await ref
                                                  .watch(
                                                      volunteeringServiceProvider)
                                                  .abandonVolunteering(
                                                      volunteering.id);
                                              shouldDisable.value = false;
                                            },
                                          ),
                                        ),
                                      )
                                    : SMCard.volunteerPostulationDetails(
                                        content: AppLocalizations.of(context)!
                                            .alreadyParticipatingInOtherVolunteering,
                                        btnText: AppLocalizations.of(context)!
                                            .abandonCurrentVolunteering,
                                        onBtnPressed: () => showDialog(
                                          context: context,
                                          builder: (BuildContext ctx) =>
                                              SModalFlip(
                                            subtitle: AppLocalizations.of(
                                                    context)!
                                                .abandonCurrentVolunteeringPrompt,
                                            cancelText:
                                                AppLocalizations.of(context)!
                                                    .cancel,
                                            confirmText:
                                                AppLocalizations.of(context)!
                                                    .confirm,
                                            context: context,
                                            onConfirm: () async {
                                              shouldDisable.value = true;
                                              await ref
                                                  .watch(
                                                      volunteeringServiceProvider)
                                                  .abandonCurrentVolunteering(
                                                      uuid.value);
                                              shouldDisable.value = false;
                                            },
                                          ),
                                        ),
                                      ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Center(
          child: SMTypography.body01(
            'Error: $error',
            color: SMColors.error100,
          ),
        ),
      ),
    );
  }
}
