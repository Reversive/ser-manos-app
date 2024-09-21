import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ser_manos/src/features/auth/presentation/sign_up_screen.dart';

class SignUpLocation extends BeamLocation {
  @override
  List<BeamPage> buildPages(
          BuildContext context, RouteInformationSerializable state) =>
      [
        BeamPage(
          key: const ValueKey(SignUpScreen.routeName),
          title: 'Sign Up',
          child: SignUpScreen(),
        ),
      ];

  @override
  List<Pattern> get pathPatterns => [
        SignUpScreen.route,
      ];
}
