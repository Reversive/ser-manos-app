import 'package:flutter/material.dart';
import 'package:ser_manos/layers/presentation/molecules/inputs/password_input.dart';
import 'package:ser_manos/layers/presentation/molecules/inputs/text_input.dart';

class CSignUp extends Column {
  CSignUp({
    super.key,
    required TextEditingController nameController,
    required TextEditingController surnameController,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required Function(String?) nameValidator,
    required Function(String?) surnameValidator,
    required Function(String?) emailValidator,
    required Function(String?) passwordValidator,
  }) : super(children: [
          TextInput(
            controller: nameController,
            labelText: "Nombre",
            validator: nameValidator,
            hintText: "Ej: Juan",
          ),
          const SizedBox(height: 24),
          TextInput(
            controller: surnameController,
            labelText: "Apellido",
            validator: surnameValidator,
            hintText: "Ej: Barcena",
          ),
          const SizedBox(height: 24),
          TextInput(
            controller: emailController,
            labelText: "Email",
            validator: emailValidator,
            hintText: "Ej: juanbarcena@mail.com",
          ),
          const SizedBox(height: 24),
          PasswordInput(
            controller: passwordController,
            labelText: "Contraseña",
            validator: passwordValidator,
            hintText: "Ej: ABCD1234",
          ),
        ]);
}
