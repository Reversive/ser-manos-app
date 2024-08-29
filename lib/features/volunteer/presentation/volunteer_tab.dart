import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ser_manos/features/volunteer/domain/voluntary.dart';
import 'package:ser_manos/shared/cells/cards/c_voluntary.dart';
import 'package:ser_manos/shared/molecules/buttons/b_floating.dart';
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
  bool showMapView = false;
  final CameraPosition _initialPosition = const CameraPosition(
      target: LatLng(-34.567336218294066, -58.464462561659), zoom: 15);

  Voluntary voluntary1 = Voluntary(
    imgURL:
        "https://s3-alpha-sig.figma.com/img/6160/48a8/56fafc1f797d16aeaaa7f76477bdc239?Expires=1725235200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=mwYAu1qoaggKtUzfPjI3Zo~sySluz7jCq5ZBeV2qmzGdJ-TZSHRAik36L0chlDwYEFvte6CZr2~pUP6RP4L4mZiFTT-3zpmm97fYdY3~8hFNW~NM4geW3BlTVFG93m1~zsJo49tuUCrId8V6qL~rzql5or9aIRWoCTUSfGY6cR9hUp-0kaVxrE4K2NtpHcGxmCKCcAHP9B8AXtYIZALVJFNls4i2t0yLyu45G9NUOV7UMtkK-vP3627b1EXYPfHgPrr13uHuDQerxJXLP09gNScM5sp~AO35kwEJAtRRZ7QFjcyQLh9sD1o8aMy9lgCBtLWAJTGjEhHbGzhFnICkxQ__",
    name: "Un techo para mi Pais",
  );

  Voluntary voluntary2 = Voluntary(
    imgURL:
        "https://s3-alpha-sig.figma.com/img/8bbc/83c6/6d6e4bcbf3c909838293a3128e40c314?Expires=1725840000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=qLjWlPtt75t96de-eRMRsxigw26ppD~KnuikGUcPJ8DQkJutrOYD5E8pc7T3FxYkJQKKUQVApFhulejewP5hP43DNhS8UpynEDg6D1hffTUa-5hDUKavf7uHFRlxmN5NMqEGQ4UnlFn3EQxsINoAVonoXLcF095q0XXeQKCMFBrs3oCAA3PO3TzKzhTMo5rFZKeZ1hU09jVEWUz962wRLvRPRAb2Wuy9ko107lRq7stRyui9DTj~5~WXOPGnUA-1PSeC41C61mIkTbObN6LcOg5Iy-mlSMJ-aB~q03hN5n3mta4JCIVJ1M2i0BBEhwEc9zFd7hEfKsTGh-gUCerJQQ__",
    name: "Manos caritativas",
  );

  @override
  Widget build(BuildContext context) {
    return showMapView
        ? Stack(
            children: [
              GoogleMap(
                initialCameraPosition: _initialPosition,
                zoomControlsEnabled: false,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 24,
                      left: 16,
                      right: 16,
                    ),
                    child: SearchInput(
                      controller: controller,
                      validator: validator,
                      onIconPressed: _onIconPressed,
                      suffixIcon: Icons.list,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 16,
                        ),
                        child: BFloating(
                          Icons.near_me,
                          onPressed: () => {},
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: CarouselSlider(
                          items: [
                            CVoluntary(
                              voluntary: voluntary1,
                              vacancies: 10,
                              margin: const EdgeInsets.only(right: 8),
                            ),
                            CVoluntary(
                              voluntary: voluntary2,
                              vacancies: 10,
                              margin: const EdgeInsets.only(right: 8),
                            ),
                            CVoluntary(
                              voluntary: voluntary2,
                              vacancies: 10,
                            ),
                          ],
                          options: CarouselOptions(
                            enableInfiniteScroll: false,
                            height: 236,
                            viewportFraction: 0.87,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )
        : Material(
            color: SMColors.secondary10,
            child: Grid(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  SearchInput(
                    controller: controller,
                    validator: validator,
                    onIconPressed: _onIconPressed,
                    suffixIcon: Icons.map_outlined,
                  ),
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
                        return CVoluntary(
                          voluntary: voluntary1,
                          vacancies: 10,
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 25,
                      ),
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

  void _onIconPressed() {
    setState(() {
      showMapView = !showMapView;
    });
  }
}
