import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ser_manos/src/features/auth/presentation/base_screen.dart';
import 'package:ser_manos/src/features/auth/presentation/sign_up_screen.dart';
import 'package:ser_manos/src/features/auth/presentation/welcome_screen.dart';
import 'package:ser_manos/src/shared/atoms/logo.dart';
import 'package:ser_manos/src/shared/cells/forms/form.dart';
import 'package:ser_manos/src/shared/cells/headers/header.dart';
import 'package:ser_manos/src/shared/molecules/buttons/button.dart';
import 'package:ser_manos/src/shared/tokens/fill.dart';
import 'package:ser_manos/src/shared/tokens/gap.dart';

class SignInScreen extends HookWidget {
  static const String route = "/sign-in";
  static const String routeName = "Sign In";
  SignInScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, ingrese su correo electrónico';
    }
    if (!value.contains('@')) {
      return 'Por favor, ingrese un correo electrónico válido';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, ingrese su contraseña';
    }
    if (value.length < 8) {
      return 'La contraseña debe tener al menos 8 caracteres';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: SMHeader.modal(
        implyLeading: false,
      ),
      body: BaseScreen(content: [
        const Spacer(),
        const SquaredLogo(),
        const SMGap.vertical(
          height: 32,
        ),
        Form(
          key: _formKey,
          child: SMForm.signIn(
            emailValidator: emailValidator,
            passwordValidator: passwordValidator,
          ),
        ),
        const Spacer(),
        const SMGap.vertical(
          height: 16,
        ),
        SMFill.horizontal(
          child: SMButton.filled(
            "Iniciar Sesión",
            onPressed: () =>
                Beamer.of(context).beamToNamed(WelcomeScreen.route),
          ),
        ),
        const SMGap.vertical(
          height: 16,
        ),
        SMFill.horizontal(
          child: SMButton.text(
            "No tengo cuenta",
            onPressed: () => Beamer.of(context).beamToNamed(SignUpScreen.route),
          ),
        ),
        const SMGap.vertical(
          height: 32,
        ),
      ]),
    );
  }
}
