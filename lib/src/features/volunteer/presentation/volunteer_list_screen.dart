import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ser_manos/src/core/providers/firebase_provider.dart';
import 'package:ser_manos/src/features/auth/models/user.dart';
import 'package:ser_manos/src/features/auth/providers/auth_provider.dart';
import 'package:ser_manos/src/features/auth/providers/user_provider.dart';
import 'package:ser_manos/src/features/volunteer/controller/volunteering_search_controller.dart';
import 'package:ser_manos/src/features/volunteer/models/volunteering.dart';
import 'package:ser_manos/src/features/volunteer/presentation/volunteer_screen.dart';
import 'package:ser_manos/src/features/volunteer/providers/volunteering_provider.dart';
import 'package:ser_manos/src/design-system/cells/cards/card.dart';
import 'package:ser_manos/src/design-system/molecules/inputs/search_input.dart';
import 'package:ser_manos/src/core/theme/colors.dart';
import 'package:ser_manos/src/design-system/tokens/gap.dart';
import 'package:ser_manos/src/design-system/tokens/grid.dart';
import 'package:ser_manos/src/design-system/tokens/typography.dart';
import 'package:ser_manos/src/features/volunteer/services/map_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VolunteerListScreen extends HookConsumerWidget {
  const VolunteerListScreen({
    super.key,
    required this.onIconPressed,
  });
  final void Function() onIconPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    final volunteerings = ref.watch(volunteeringSearchControllerProvider);
    final currentUser = useState(null as User?);
    final currentVolunteer = useState(null as Volunteering?);
    final isFavoriteEnabled = useState(true);
    final analyticsService = ref.watch(analyticsServiceProvider);

    ref.watch(remoteConfigProvider).whenData(
        (rc) => isFavoriteEnabled.value = rc.enableVolunteeringFavorite);

    ref.watch(currentUserProvider).whenData((user) {
      currentUser.value = user;
    });

    ref
        .watch(activeVolunteeringProvider(currentUser.value?.uuid ?? ''))
        .whenData((volunteer) {
      currentVolunteer.value = volunteer;
    });

    return volunteerings.when(
      data: (volunteers) => RefreshIndicator(
        onRefresh: () async {
          return ref.refresh(volunteeringSearchControllerProvider);
        },
        color: SMColors.primary100,
        child: Material(
          color: SMColors.secondary10,
          child: Column(
            children: [
              const SMGap.vertical(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SMSearchInput(
                  controller: searchController,
                  onIconPressed: onIconPressed,
                  suffixIcon: Icons.map_outlined,
                  onChanged: (value) => ref
                      .read(volunteeringSearchControllerProvider.notifier)
                      .search(searchController.text),
                ),
              ),
              SMGap.vertical(
                height: currentVolunteer.value != null ? 24 : 32,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  child: SMGrid(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (currentVolunteer.value != null) ...[
                          SMTypography.headline01(
                              AppLocalizations.of(context)!.yourActivity),
                          const SMGap.vertical(height: 16),
                          SMCard.currentVolunteer(
                            volunteering: currentVolunteer.value!,
                            context: context,
                          ),
                        ],
                        SMGap.vertical(
                            height: currentVolunteer.value != null ? 24 : 0),
                        SMTypography.headline01(
                          AppLocalizations.of(context)!.volunteerings,
                          align: TextAlign.start,
                        ),
                        SMGap.vertical(height: volunteers.isEmpty ? 16 : 24),
                        volunteers.isEmpty
                            ? SMCard.noVolunteerings(
                                message: AppLocalizations.of(context)!
                                    .noVolunteerings,
                                context: context,
                              )
                            : ListView.separated(
                                itemBuilder: (_, index) {
                                  return SMCard.volunteer(
                                    context: context,
                                    isFavoriteEnabled: isFavoriteEnabled.value,
                                    onFavorite: () async {
                                      if (currentUser.value == null) return;
                                      if (currentUser
                                          .value!.favoriteVolunteerings
                                          .contains(volunteers[index].id)) {
                                        await ref
                                            .read(userRepositoryProvider)
                                            .removeFavoriteVolunteering(
                                              currentUser.value!.uuid,
                                              volunteers[index].id,
                                            );
                                        await analyticsService
                                            .logVolunteeringUnfavorite(
                                          volunteers[index].id,
                                        );
                                      } else {
                                        await ref
                                            .read(userRepositoryProvider)
                                            .setFavoriteVolunteering(
                                              currentUser.value!.uuid,
                                              volunteers[index].id,
                                            );
                                        await analyticsService
                                            .logVolunteeringFavorite(
                                          volunteers[index].id,
                                        );
                                      }
                                    },
                                    onLocation: () => MapService.launchMap(
                                      volunteers[index].location.lat,
                                      volunteers[index].location.lng,
                                    ),
                                    isFavorite: currentUser.value != null
                                        ? currentUser
                                            .value!.favoriteVolunteerings
                                            .contains(volunteers[index].id)
                                        : false,
                                    volunteer: volunteers[index],
                                    onTap: () {
                                      Beamer.of(context).beamToNamed(
                                        '${VolunteerScreen.route}?id=${volunteers[index].id}',
                                        beamBackOnPop: true,
                                      );
                                    },
                                    vacancies: ref
                                        .watch(volunteeringVacanciesProvider(
                                            volunteers[index].id))
                                        .when(
                                          data: (vacancies) => vacancies,
                                          error: (e, s) => 0,
                                          loading: () => 0,
                                        ),
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    const SMGap.vertical(height: 25),
                                itemCount: volunteers.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                              ),
                      ],
                    ),
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
      error: (error, _) => Center(
        child: SMTypography.body01(
          'Error: $error',
          color: SMColors.error100,
        ),
      ),
    );
  }
}
