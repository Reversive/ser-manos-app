import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ser_manos/src/features/auth/presentation/splash_screen.dart';

class SplashLocation extends BeamLocation {
  @override
  List<BeamPage> buildPages(
          BuildContext context, RouteInformationSerializable state) =>
      [
        const BeamPage(
          key: ValueKey(SplashScreen.routeName),
          title: 'Splash',
          child: SplashScreen(),
        ),
      ];

  @override
  List<Pattern> get pathPatterns => [
        SplashScreen.route,
      ];
}
