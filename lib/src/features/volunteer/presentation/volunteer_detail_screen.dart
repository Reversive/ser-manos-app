import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ser_manos/src/core/theme/colors.dart';
import 'package:ser_manos/src/features/volunteer/providers/volunteering_provider.dart';
import 'package:ser_manos/src/shared/cells/cards/card.dart';
import 'package:ser_manos/src/shared/cells/headers/header.dart';
import 'package:ser_manos/src/shared/molecules/buttons/button.dart';
import 'package:ser_manos/src/shared/molecules/components/component.dart';
import 'package:ser_manos/src/shared/tokens/fill.dart';
import 'package:ser_manos/src/shared/tokens/gap.dart';
import 'package:ser_manos/src/shared/tokens/grid.dart';
import 'package:ser_manos/src/shared/tokens/typography.dart';

class VolunteerDetailScreen extends HookConsumerWidget {
  const VolunteerDetailScreen({super.key, required this.id});
  static const String route = '/home/volunteers/:id';

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final volunteeringDetail = ref.watch(volunteeringDetailProvider(id));

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: SMHeader.transparent(),
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
                          "ACCIÓN SOCIAL",
                          color: SMColors.neutral75,
                        ),
                        SMTypography.headline01(volunteering.name),
                        const SMGap.vertical(height: 16),
                        SMTypography.body01(
                          volunteering.purpose,
                          color: SMColors.secondary200,
                        ),
                        const SMGap.vertical(height: 24),
                        SMTypography.headline02("Sobre la actividad"),
                        const SMGap.vertical(height: 8),
                        SMTypography.body01(
                          volunteering.about,
                        ),
                        const SMGap.vertical(height: 24),
                        SMCard.location(
                          hasEmbeddedMap: true,
                          location: volunteering.location,
                        ),
                        const SMGap.vertical(height: 32),
                        SMTypography.headline02("Participar del voluntariado"),
                        const SMGap.vertical(height: 8),
                        SMTypography.subtitle01("Requisitos"),
                        const SMGap.vertical(height: 8),
                        SMComponent.bulletList(
                          items: volunteering.requirements,
                        ),
                        const SMGap.vertical(height: 8),
                        SMTypography.subtitle01("Dispobilidad"),
                        const SMGap.vertical(height: 8),
                        SMComponent.bulletList(
                          items: volunteering.availability,
                        ),
                        const SMGap.vertical(height: 8),
                        SMComponent.vacancy(
                            vacancies: ref
                                .watch(volunteeringVacanciesProvider(
                                    volunteering.id))
                                .when(
                                  data: (vacancies) => vacancies,
                                  error: (e, s) => 0,
                                  loading: () => 0,
                                )),
                        const SMGap.vertical(height: 24),
                        SMFill.horizontal(
                          child: SMButton.filled(
                            "Postularme",
                            onPressed: () {},
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
