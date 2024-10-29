import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ser_manos/src/core/theme/colors.dart';
import 'package:ser_manos/src/design-system/cells/modals/modal.dart';
import 'package:ser_manos/src/design-system/molecules/buttons/button.dart';
import 'package:ser_manos/src/features/auth/providers/auth_provider.dart';
import 'package:ser_manos/src/features/volunteer/providers/volunteering_provider.dart';
import 'package:ser_manos/src/design-system/cells/cards/card.dart';
import 'package:ser_manos/src/design-system/cells/headers/header.dart';
import 'package:ser_manos/src/design-system/molecules/components/component.dart';
import 'package:ser_manos/src/design-system/tokens/fill.dart';
import 'package:ser_manos/src/design-system/tokens/gap.dart';
import 'package:ser_manos/src/design-system/tokens/grid.dart';
import 'package:ser_manos/src/design-system/tokens/typography.dart';

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
                        SMComponent.vacancy(vacancies: vacancies),
                        const SMGap.vertical(height: 24),
                        !isPostulatedOrVolunteering
                            ? Column(
                                children: [
                                  if (vacancies == 0)
                                    SMTypography.body01(
                                        "No hay vacantes disponibles para postularse",
                                        align: TextAlign.center),
                                  if (vacancies == 0)
                                    const SMGap.vertical(height: 24),
                                  SMFill.horizontal(
                                    child: SMButton.filled(
                                      "Postularme",
                                      disabled:
                                          vacancies == 0 || shouldDisable.value,
                                      onPressed: () => showDialog(
                                        context: context,
                                        builder: (BuildContext ctx) =>
                                            SModalFlip(
                                          title: volunteering.name,
                                          subtitle: "Te estas por postular a",
                                          cancelText: "Cancelar",
                                          confirmText: "Confirmar",
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
                                    ),
                                  ),
                                ],
                              )
                            : isPostulated
                                ? SMCard.volunteerPostulationDetails(
                                    title: "Te has postulado",
                                    content:
                                        "Pronto la organizacion se pondra en contacto contigo y te inscribira como participante",
                                    btnText: "Retirar postulacion",
                                    shouldDisable: shouldDisable.value,
                                    onBtnPressed: () => showDialog(
                                      context: context,
                                      builder: (BuildContext ctx) => SModalFlip(
                                        title: volunteering.name,
                                        subtitle:
                                            "¿Estas seguro que queres retirar tu postulacion?",
                                        cancelText: "Cancelar",
                                        confirmText: "Confirmar",
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
                                        title: "Estas participando",
                                        content:
                                            "La organizacion confirmo que ya estas participando de este voluntariado",
                                        btnText: "Abandonar voluntariado",
                                        shouldDisable: shouldDisable.value,
                                        onBtnPressed: () => showDialog(
                                          context: context,
                                          builder: (BuildContext ctx) =>
                                              SModalFlip(
                                            title: volunteering.name,
                                            subtitle:
                                                "¿Estas seguro que queres abandonar tu voluntariado?",
                                            cancelText: "Cancelar",
                                            confirmText: "Confirmar",
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
                                        content:
                                            "Ya estas participando en otro voluntariado, debes abandonarlo primero para postularte a este",
                                        btnText:
                                            "Abandonar voluntariado actual",
                                        onBtnPressed: () => showDialog(
                                          context: context,
                                          builder: (BuildContext ctx) =>
                                              SModalFlip(
                                            subtitle:
                                                "¿Estas seguro que queres abandonar tu voluntariado actual?",
                                            cancelText: "Cancelar",
                                            confirmText: "Confirmar",
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
