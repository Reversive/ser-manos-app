import 'package:flutter/material.dart';
import 'package:ser_manos/features/volunteer/domain/voluntary.dart';
import 'package:ser_manos/shared/cells/cards/c_voluntary.dart';
import 'package:ser_manos/shared/molecules/inputs/search_input.dart';
import 'package:ser_manos/shared/tokens/colors.dart';
import 'package:ser_manos/shared/tokens/grid.dart';
import 'package:ser_manos/shared/tokens/typographies/t_headline01.dart';

class VolunteerTab extends StatefulWidget {
  const VolunteerTab({super.key});

  @override
  State<VolunteerTab> createState() => _VolunteerTabState();
}

class _VolunteerTabState extends State<VolunteerTab> {
  TextEditingController controller = TextEditingController();
  String? validator(String? value) => null;

  Voluntary voluntary = Voluntary(
    imgURL:
        "https://s3-alpha-sig.figma.com/img/6160/48a8/56fafc1f797d16aeaaa7f76477bdc239?Expires=1725235200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=mwYAu1qoaggKtUzfPjI3Zo~sySluz7jCq5ZBeV2qmzGdJ-TZSHRAik36L0chlDwYEFvte6CZr2~pUP6RP4L4mZiFTT-3zpmm97fYdY3~8hFNW~NM4geW3BlTVFG93m1~zsJo49tuUCrId8V6qL~rzql5or9aIRWoCTUSfGY6cR9hUp-0kaVxrE4K2NtpHcGxmCKCcAHP9B8AXtYIZALVJFNls4i2t0yLyu45G9NUOV7UMtkK-vP3627b1EXYPfHgPrr13uHuDQerxJXLP09gNScM5sp~AO35kwEJAtRRZ7QFjcyQLh9sD1o8aMy9lgCBtLWAJTGjEhHbGzhFnICkxQ__",
    name: "Un techo para mi Pais",
  );

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
            SearchInput(controller: controller, validator: validator),
            const SizedBox(
              height: 24,
            ),
            THeadline1(
              "Voluntariados",
              textAlign: TextAlign.start,
            ),
            // ADD VOLUNTEER CHECK HERE
            Expanded(
              child: ListView.separated(
                itemBuilder: (_, idx) {
                  return CVoluntary(voluntary: voluntary, vacancies: 10);
                },
                separatorBuilder: ((_, idx) => const SizedBox(height: 25)),
                itemCount: 5,
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
