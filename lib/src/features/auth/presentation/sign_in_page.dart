import 'package:flutter/material.dart';
import 'package:ser_manos/src/features/auth/presentation/base_page.dart';
import 'package:ser_manos/src/shared/atoms/logo.dart';
import 'package:ser_manos/src/shared/cells/forms/form.dart';
import 'package:ser_manos/src/shared/cells/headers/header.dart';
import 'package:ser_manos/src/shared/molecules/buttons/button.dart';
import 'package:ser_manos/src/shared/tokens/gap.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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
      body: BasePage(content: [
        const Spacer(),
        const SquaredLogo(),
        const SMGap.vertical(
          height: 32,
        ),
        Form(
          key: _formKey,
          child: SMForm.signIn(
            emailController: emailController,
            passwordController: passwordController,
            emailValidator: emailValidator,
            passwordValidator: passwordValidator,
          ),
        ),
        const Spacer(),
        const SMGap.vertical(
          height: 16,
        ),
        SizedBox(
          width: double.infinity,
          child: SMButton.filled(
            "Iniciar Sesión",
            onPressed: () => print("TODO"),
          ),
        ),
        const SMGap.vertical(
          height: 16,
        ),
        SizedBox(
          width: double.infinity,
          child: SMButton.text(
            "Registrarse",
            onPressed: () => print("TODO"),
          ),
        ),
        const SMGap.vertical(
          height: 32,
        ),
      ]),
    );
  }
}
