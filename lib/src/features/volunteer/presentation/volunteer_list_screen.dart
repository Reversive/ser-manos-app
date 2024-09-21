import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ser_manos/src/features/volunteer/domain/volunteer.dart';
import 'package:ser_manos/src/features/volunteer/presentation/volunteer_screen.dart';
import 'package:ser_manos/src/shared/cells/cards/card.dart';
import 'package:ser_manos/src/shared/molecules/inputs/search_input.dart';
import 'package:ser_manos/src/core/theme/colors.dart';
import 'package:ser_manos/src/shared/tokens/gap.dart';
import 'package:ser_manos/src/shared/tokens/grid.dart';
import 'package:ser_manos/src/shared/tokens/typography.dart';

class VolunteerListScreen extends HookWidget {
  const VolunteerListScreen({
    super.key,
    required this.onIconPressed,
    required this.volunteers,
  });
  final void Function() onIconPressed;
  final List<Volunteer> volunteers;

  String? validator(String? value) => null;

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = useTextEditingController();
    return Material(
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
              validator: validator,
              onIconPressed: onIconPressed,
              suffixIcon: Icons.map_outlined,
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
    );
  }
}
