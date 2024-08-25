import 'package:flutter/material.dart';
import 'package:ser_manos/features/auth/presentation/base_page.dart';
import 'package:ser_manos/shared/atoms/logo.dart';
import 'package:ser_manos/shared/cells/forms/c_sign_in.dart';
import 'package:ser_manos/shared/cells/headers/ab_modal_header.dart';
import 'package:ser_manos/shared/molecules/buttons/b_cta_filled.dart';
import 'package:ser_manos/shared/molecules/buttons/b_cta_text.dart';

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
      appBar: ABModalHeader(
        implyLeading: false,
      ),
      body: BasePage(content: [
        const Spacer(),
                        const SquaredLogo(),
                        const SizedBox(
                          height: 32,
                        ),
                        Form(
                          key: _formKey,
                          child: CSignIn(
                            emailController: emailController,
                            passwordController: passwordController,
                            emailValidator: emailValidator,
                            passwordValidator: passwordValidator,
                          ),
                        ),
                        const Spacer(),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: BCtaFilled(
                            "Iniciar Sesión",
                            onPressed: () => print("TODO"),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: BCtaText(
                            "Registrarse",
                            onPressed: () => print("TODO"),
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
      ]),
    );
  }
}
