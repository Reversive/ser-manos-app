import 'package:flutter/material.dart';
import 'package:ser_manos/layers/presentation/molecules/inputs/password_input.dart';
import 'package:ser_manos/layers/presentation/molecules/inputs/text_input.dart';

class CSignIn extends Column {
  CSignIn({
    super.key,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required Function(String?) emailValidator,
    required Function(String?) passwordValidator,
  }) : super(children: [
          TextInput(
            controller: emailController,
            labelText: "Email",
            validator: emailValidator,
          ),
          const SizedBox(height: 24),
          PasswordInput(
            controller: passwordController,
            labelText: "Contraseña",
            validator: passwordValidator,
          ),
        ]);
}
