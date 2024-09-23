import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ser_manos/src/features/profile/models/location.dart';
import 'package:ser_manos/src/features/volunteer/presentation/volunteer_map_screen.dart';
import 'package:ser_manos/src/features/volunteer/domain/volunteer.dart';
import 'package:ser_manos/src/features/volunteer/presentation/volunteer_list_screen.dart';

class VolunteerScreen extends HookWidget {
  static const String route = '/home/volunteers';
  static const String routeName = 'volunteers';

  const VolunteerScreen({super.key});

  static const Volunteer volunteer1 = Volunteer(
    imgURL:
        "https://s3-alpha-sig.figma.com/img/6160/48a8/56fafc1f797d16aeaaa7f76477bdc239?Expires=1726444800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=HTqRkCA9HkzBXUqy1-U-~S2Egj66cx0jkjzkOFygR~3SSXssYkXGreQvKHcVEMuKdMIZNqwoMCaejZ3w6u8g9TYJ7ckTU-ZKOsqbQuRyOxImZfn3SsjEmuyVFOkrGEHRtmbbbpJto8RUpEfCrjvz8mvVQaDUF7kLaYY3gQhorueLnNgZrwQw7HzBixI-qd5EzYZpBAAEW5InP2SK6q1TD2ZbMADtT1yt2-C~ARvO-ReqCuMBRev1wqlTNHGNXOJ0nJK23hCDJLp496B~GKjA9v1318r6ARKrNc8XfLG5Abhh20gM6dLD3BSIXrLZZnz3T-bxGBhDOBaWdGu3JCHZ4A__",
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

  static const Volunteer volunteer2 = Volunteer(
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

  @override
  Widget build(BuildContext context) {
    final showMapView = useState(false);
    final voluntaries = [volunteer1, volunteer2];
    void onIconPressed() {
      showMapView.value = !showMapView.value;
    }

    return showMapView.value
        ? VolunteerMapScreen(
            onIconPressed: onIconPressed,
            volunteers: voluntaries,
          )
        : VolunteerListScreen(
            onIconPressed: onIconPressed,
            volunteers: voluntaries,
          );
  }
}
