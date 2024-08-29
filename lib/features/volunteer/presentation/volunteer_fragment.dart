import 'package:flutter/material.dart';
import 'package:ser_manos/features/volunteer/domain/voluntary.dart';
import 'package:ser_manos/shared/cells/cards/c_voluntary.dart';
import 'package:ser_manos/shared/molecules/inputs/search_input.dart';
import 'package:ser_manos/shared/tokens/colors.dart';
import 'package:ser_manos/shared/tokens/grid.dart';
import 'package:ser_manos/shared/tokens/typographies/t_headline01.dart';

class VolunteerFragment extends StatefulWidget {
  const VolunteerFragment({
    super.key,
    required this.onIconPressed,
    required this.voluntaries,
  });
  final void Function() onIconPressed;
  final List<Voluntary> voluntaries;

  @override
  State<VolunteerFragment> createState() => _VolunteerFragmentState();
}

class _VolunteerFragmentState extends State<VolunteerFragment> {
  TextEditingController searchController = TextEditingController();
  String? validator(String? value) => null;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: SMColors.secondary10,
      child: Grid(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 24,
            ),
            SearchInput(
              controller: searchController,
              validator: validator,
              onIconPressed: widget.onIconPressed,
              suffixIcon: Icons.map_outlined,
            ),
            const SizedBox(
              height: 24,
            ),
            THeadline1(
              "Voluntariados",
              textAlign: TextAlign.start,
            ),
            // TODO: ADD VOLUNTEER CHECK HERE
            Expanded(
              child: ListView.separated(
                itemBuilder: (_, index) {
                  return CVoluntary(
                    voluntary: widget.voluntaries[index],
                    vacancies: 10,
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 25,
                ),
                itemCount: widget.voluntaries.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
