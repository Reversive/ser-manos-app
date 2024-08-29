import 'package:flutter/material.dart';
import 'package:ser_manos/features/volunteer/domain/voluntary.dart';
import 'package:ser_manos/shared/cells/cards/c_no_volunteerings.dart';
import 'package:ser_manos/shared/cells/cards/c_volunteer.dart';
import 'package:ser_manos/shared/molecules/inputs/search_input.dart';
import 'package:ser_manos/shared/tokens/colors.dart';
import 'package:ser_manos/shared/tokens/grid.dart';
import 'package:ser_manos/shared/tokens/typographies/t_headline01.dart';

class VolunteerFragment extends StatefulWidget {
  const VolunteerFragment({
    super.key,
    required this.onIconPressed,
    required this.volunteers,
  });
  final void Function() onIconPressed;
  final List<Voluntary> volunteers;

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
            SizedBox(
              height: widget.volunteers.isEmpty ? 16 : 24,
            ),
            widget.volunteers.isEmpty
                ? CNoVolunteerings()
                : Expanded(
                    child: ListView.separated(
                      itemBuilder: (_, index) {
                        return CVolunteer(
                          voluntary: widget.volunteers[index],
                          vacancies: 10,
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 25,
                      ),
                      itemCount: widget.volunteers.length,
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
