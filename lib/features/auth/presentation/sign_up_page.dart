import 'package:flutter/material.dart';
import 'package:ser_manos/features/auth/presentation/base_page.dart';
import 'package:ser_manos/shared/atoms/logo.dart';
import 'package:ser_manos/shared/cells/forms/c_sign_up.dart';
import 'package:ser_manos/shared/molecules/buttons/b_cta_filled.dart';
import 'package:ser_manos/shared/molecules/buttons/b_cta_text.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BasePage(content: [
      const SquaredLogo(),
      const SizedBox(
        height: 32,
      ),
      Form(
        key: _formKey,
        child: CSignUp(
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
        child: BCtaFilled(
          "Registrarse",
          onPressed: () => print("TODO"),
        ),
      ),
      const SizedBox(
        height: 16,
      ),
      SizedBox(
        width: double.infinity,
        child: BCtaText(
          "Ya tengo cuenta",
          onPressed: () => print("TODO"),
        ),
      ),
      const SizedBox(
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
