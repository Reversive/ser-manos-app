import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ser_manos/src/features/auth/presentation/welcome_screen.dart';

class WelcomeLocation extends BeamLocation {
  @override
  List<BeamPage> buildPages(
          BuildContext context, RouteInformationSerializable state) =>
      [
        const BeamPage(
          key: ValueKey(WelcomeScreen.routeName),
          title: 'Welcome',
          child: WelcomeScreen(),
        ),
      ];

  @override
  List<Pattern> get pathPatterns => [
        WelcomeScreen.route,
      ];
}
