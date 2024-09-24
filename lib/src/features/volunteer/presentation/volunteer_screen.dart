import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ser_manos/src/features/volunteer/presentation/volunteer_map_screen.dart';
import 'package:ser_manos/src/features/volunteer/presentation/volunteer_list_screen.dart';

class VolunteerScreen extends HookWidget {
  static const String route = '/home/volunteers';
  static const String routeName = 'volunteers';

  const VolunteerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final showMapView = useState(false);

    void onIconPressed() {
      showMapView.value = !showMapView.value;
    }

    return showMapView.value
        ? VolunteerMapScreen(
            onIconPressed: onIconPressed,
          )
        : VolunteerListScreen(
            onIconPressed: onIconPressed,
          );
  }
}
