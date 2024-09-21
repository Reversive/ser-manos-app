import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ser_manos/src/features/auth/presentation/sign_in_screen.dart';

class SignInLocation extends BeamLocation {
  @override
  List<BeamPage> buildPages(
          BuildContext context, RouteInformationSerializable state) =>
      [
        BeamPage(
          key: const ValueKey(SignInScreen.routeName),
          title: 'Sign In',
          child: SignInScreen(),
        ),
      ];

  @override
  List<Pattern> get pathPatterns => [
        SignInScreen.route,
      ];
}
