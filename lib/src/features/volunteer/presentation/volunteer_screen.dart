import 'package:flutter/material.dart';
import 'package:ser_manos/src/features/profile/domain/location.dart';
import 'package:ser_manos/src/features/volunteer/presentation/volunteer_map_screen.dart';
import 'package:ser_manos/src/features/volunteer/domain/volunteer.dart';
import 'package:ser_manos/src/features/volunteer/presentation/volunteer_list_screen.dart';

class VolunteerScreen extends StatefulWidget {
  static const String route = '/volunteers';
  static const String routeName = 'volunteers';

  const VolunteerScreen({super.key});

  @override
  State<VolunteerScreen> createState() => _VolunteerScreenState();
}

class _VolunteerScreenState extends State<VolunteerScreen> {
  bool showMapView = false;

  Volunteer volunteer1 = Volunteer(
    imgURL:
        "https://s3-alpha-sig.figma.com/img/6160/48a8/56fafc1f797d16aeaaa7f76477bdc239?Expires=1725235200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=mwYAu1qoaggKtUzfPjI3Zo~sySluz7jCq5ZBeV2qmzGdJ-TZSHRAik36L0chlDwYEFvte6CZr2~pUP6RP4L4mZiFTT-3zpmm97fYdY3~8hFNW~NM4geW3BlTVFG93m1~zsJo49tuUCrId8V6qL~rzql5or9aIRWoCTUSfGY6cR9hUp-0kaVxrE4K2NtpHcGxmCKCcAHP9B8AXtYIZALVJFNls4i2t0yLyu45G9NUOV7UMtkK-vP3627b1EXYPfHgPrr13uHuDQerxJXLP09gNScM5sp~AO35kwEJAtRRZ7QFjcyQLh9sD1o8aMy9lgCBtLWAJTGjEhHbGzhFnICkxQ__",
    name: "Un techo para mi Pais",
    location: Location(
      street: "Loc1",
      number: 123,
      city: "Capital Federal",
      state: "Buenos Aires",
      lat: -34.62283169075434,
      lng: -58.44644063941437,
    ),
    vacancies: 10,
  );

  Volunteer volunteer2 = Volunteer(
    imgURL:
        "https://s3-alpha-sig.figma.com/img/8bbc/83c6/6d6e4bcbf3c909838293a3128e40c314?Expires=1725840000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=qLjWlPtt75t96de-eRMRsxigw26ppD~KnuikGUcPJ8DQkJutrOYD5E8pc7T3FxYkJQKKUQVApFhulejewP5hP43DNhS8UpynEDg6D1hffTUa-5hDUKavf7uHFRlxmN5NMqEGQ4UnlFn3EQxsINoAVonoXLcF095q0XXeQKCMFBrs3oCAA3PO3TzKzhTMo5rFZKeZ1hU09jVEWUz962wRLvRPRAb2Wuy9ko107lRq7stRyui9DTj~5~WXOPGnUA-1PSeC41C61mIkTbObN6LcOg5Iy-mlSMJ-aB~q03hN5n3mta4JCIVJ1M2i0BBEhwEc9zFd7hEfKsTGh-gUCerJQQ__",
    name: "Manos caritativas",
    location: Location(
      street: "Loc1",
      number: 123,
      city: "Capital Federal",
      state: "Buenos Aires",
      lat: -34.61750773870162,
      lng: -58.444200634967096,
    ),
    vacancies: 20,
  );

  late List<Volunteer> voluntaries;

  @override
  void initState() {
    voluntaries = [volunteer1, volunteer2];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return showMapView
        ? VolunteerMapScreen(
            onIconPressed: _onIconPressed,
            volunteers: voluntaries,
          )
        : VolunteerListScreen(
            onIconPressed: _onIconPressed,
            volunteers: voluntaries,
          );
  }

  void _onIconPressed() {
    setState(() {
      showMapView = !showMapView;
    });
  }
}
