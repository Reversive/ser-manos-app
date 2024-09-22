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
        Form(
          key: _formKey,
          child: SMForm.signUp(
            nameValidator: nameValidator,
            surnameValidator: surnameValidator,
            emailValidator: emailValidator,
            passwordValidator: passwordValidator,
          ),
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

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, ingrese su nombre';
    }
    return null;
  }

  String? surnameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, ingrese su apellido';
    }
    return null;
  }

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
}
