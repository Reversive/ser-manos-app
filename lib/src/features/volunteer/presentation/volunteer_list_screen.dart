import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ser_manos/src/features/volunteer/controller/volunteering_search_controller.dart';
import 'package:ser_manos/src/features/volunteer/presentation/volunteer_screen.dart';
import 'package:ser_manos/src/features/volunteer/providers/volunteering_provider.dart';
import 'package:ser_manos/src/design-system/cells/cards/card.dart';
import 'package:ser_manos/src/design-system/molecules/inputs/search_input.dart';
import 'package:ser_manos/src/core/theme/colors.dart';
import 'package:ser_manos/src/design-system/tokens/gap.dart';
import 'package:ser_manos/src/design-system/tokens/grid.dart';
import 'package:ser_manos/src/design-system/tokens/typography.dart';

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

    return volunteerings.when(
      data: (volunteers) => RefreshIndicator(
        onRefresh: () async =>
            ref.refresh(volunteeringSearchControllerProvider),
        color: SMColors.primary100,
        child: Material(
          color: SMColors.secondary10,
          child: SMGrid(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SMGap.vertical(
                  height: 24,
                ),
                SMSearchInput(
                  controller: searchController,
                  onIconPressed: onIconPressed,
                  suffixIcon: Icons.map_outlined,
                  onChanged: (value) => ref
                      .read(volunteeringSearchControllerProvider.notifier)
                      .search(searchController.text),
                ),
                const SMGap.vertical(
                  height: 24,
                ),
                SMTypography.headline01(
                  "Voluntariados",
                  align: TextAlign.start,
                ),
                SizedBox(
                  height: volunteers.isEmpty ? 16 : 24,
                ),
                volunteers.isEmpty
                    ? SMCard.noVolunteerings()
                    : Expanded(
                        child: ListView.separated(
                          itemBuilder: (_, index) {
                            return SMCard.volunteer(
                              volunteer: volunteers[index],
                              onTap: () {
                                Beamer.of(context).beamToNamed(
                                  '${VolunteerScreen.route}?id=$index',
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
                              const SMGap.vertical(
                            height: 25,
                          ),
                          itemCount: volunteers.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                        ),
                      ),
              ],
            ),
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
