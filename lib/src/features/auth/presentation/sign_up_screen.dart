import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ser_manos/src/features/auth/presentation/base_screen.dart';
import 'package:ser_manos/src/features/auth/presentation/sign_in_screen.dart';
import 'package:ser_manos/src/features/auth/presentation/welcome_screen.dart';
import 'package:ser_manos/src/shared/atoms/logo.dart';
import 'package:ser_manos/src/shared/cells/forms/form.dart';
import 'package:ser_manos/src/shared/molecules/buttons/button.dart';
import 'package:ser_manos/src/shared/tokens/fill.dart';
import 'package:ser_manos/src/shared/tokens/gap.dart';

class SignUpScreen extends HookWidget {
  static const String route = "/sign-up";
  static const String routeName = "Sign Up";
  SignUpScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      content: [
        const SquaredLogo(),
        const SMGap.vertical(
          height: 32,
        ),
        SMForm.signUp(
          formKey: _formKey,
        ),
        const Spacer(),
        SMFill.horizontal(
          child: SMButton.filled(
            "Registrarse",
            onPressed: () =>
                Beamer.of(context).beamToNamed(WelcomeScreen.route),
          ),
        ),
        const SMGap.vertical(
          height: 16,
        ),
        SMFill.horizontal(
          child: SMButton.text(
            "Ya tengo cuenta",
            onPressed: () => Beamer.of(context).beamToNamed(SignInScreen.route),
          ),
        ),
        const SMGap.vertical(
          height: 32,
        ),
      ],
    );
  }
}
