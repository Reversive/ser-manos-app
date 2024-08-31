import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ser_manos/src/features/auth/presentation/base_screen.dart';
import 'package:ser_manos/src/features/auth/presentation/sign_in_screen.dart';
import 'package:ser_manos/src/features/auth/presentation/welcome_screen.dart';
import 'package:ser_manos/src/shared/atoms/logo.dart';
import 'package:ser_manos/src/shared/cells/forms/form.dart';
import 'package:ser_manos/src/shared/molecules/buttons/button.dart';
import 'package:ser_manos/src/shared/tokens/gap.dart';

class SignUpScreen extends StatefulWidget {
  static const String route = "/sign-up";
  static const String routeName = "Sign Up";
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseScreen(content: [
      const SquaredLogo(),
      const SMGap.vertical(
        height: 32,
      ),
      Form(
        key: _formKey,
        child: SMForm.signUp(
          nameController: nameController,
          surnameController: surnameController,
          emailController: emailController,
          passwordController: passwordController,
          nameValidator: nameValidator,
          surnameValidator: surnameValidator,
          emailValidator: emailValidator,
          passwordValidator: passwordValidator,
        ),
      ),
      const Spacer(),
      SizedBox(
        width: double.infinity,
        child: SMButton.filled(
          "Registrarse",
          onPressed: () => Beamer.of(context).beamToNamed(WelcomeScreen.route),
        ),
      ),
      const SMGap.vertical(
        height: 16,
      ),
      SizedBox(
        width: double.infinity,
        child: SMButton.text(
          "Ya tengo cuenta",
          onPressed: () => Beamer.of(context).beamToNamed(SignInScreen.route),
        ),
      ),
      const SMGap.vertical(
        height: 32,
      ),
    ]);
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
