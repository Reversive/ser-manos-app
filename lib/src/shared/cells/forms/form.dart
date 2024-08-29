import 'package:flutter/material.dart';
import 'package:ser_manos/src/shared/cells/cards/card.dart';
import 'package:ser_manos/src/shared/molecules/inputs/calendar_input.dart';
import 'package:ser_manos/src/shared/molecules/inputs/password_input.dart';
import 'package:ser_manos/src/shared/molecules/inputs/text_input.dart';
import 'package:ser_manos/src/shared/tokens/gap.dart';
import 'package:ser_manos/src/shared/tokens/typography.dart';

class SMForm extends StatelessWidget {
  const SMForm({super.key, required this.children});

  factory SMForm.contactDetails({
    required TextEditingController phoneController,
    required TextEditingController mailController,
    required Function(String?) phoneValidator,
    required Function(String?) mailValidator,
  }) {
    return SMForm(
      children: [
        SMTypography.headline01("Datos de contacto"),
        const SMGap.vertical(height: 24.0),
        SMTypography.subtitle01(
            "Estos datos serán compartidos con la organización para ponerse en contacto contigo"),
        const SMGap.vertical(height: 24.0),
        SMTextInput(
          controller: phoneController,
          labelText: "Teléfono",
          hintText: "Ej: +541178445459",
          validator: phoneValidator,
        ),
        const SMGap.vertical(height: 24.0),
        SMTextInput(
          controller: mailController,
          validator: mailValidator,
          labelText: "Mail",
          hintText: "Ej: mimail@mail.com",
        )
      ],
    );
  }

  factory SMForm.personalDetails({
    required TextEditingController calendarController,
    required Function(String?) calendarValidator,
  }) {
    return SMForm(
      children: [
        SMTypography.headline01("Datos de perfil"),
        const SMGap.vertical(height: 24),
        SMCalendarInput(
          controller: calendarController,
          validator: calendarValidator,
          hintText: "DD/MM/YYYY",
          labelText: "Fecha de nacimiento",
        ),
        const SMGap.vertical(height: 24),
        SMCard.input(title: "Información de perfil"),
        const SMGap.vertical(height: 24),
        SMCard.profile(),
      ],
    );
  }

  factory SMForm.signIn({
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required Function(String?) emailValidator,
    required Function(String?) passwordValidator,
  }) {
    return SMForm(
      children: [
        SMTextInput(
          controller: emailController,
          labelText: "Email",
          validator: emailValidator,
        ),
        const SMGap.vertical(height: 24),
        SMPasswordInput(
          controller: passwordController,
          labelText: "Contraseña",
          validator: passwordValidator,
        ),
      ],
    );
  }

  factory SMForm.signUp({
    required TextEditingController nameController,
    required TextEditingController surnameController,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required Function(String?) nameValidator,
    required Function(String?) surnameValidator,
    required Function(String?) emailValidator,
    required Function(String?) passwordValidator,
  }) {
    return SMForm(
      children: [
        SMTextInput(
          controller: nameController,
          labelText: "Nombre",
          validator: nameValidator,
          hintText: "Ej: Juan",
        ),
        const SMGap.vertical(height: 24),
        SMTextInput(
          controller: surnameController,
          labelText: "Apellido",
          validator: surnameValidator,
          hintText: "Ej: Barcena",
        ),
        const SMGap.vertical(height: 24),
        SMTextInput(
          controller: emailController,
          labelText: "Email",
          validator: emailValidator,
          hintText: "Ej: juanbarcena@mail.com",
        ),
        const SMGap.vertical(height: 24),
        SMPasswordInput(
          controller: passwordController,
          labelText: "Contraseña",
          validator: passwordValidator,
          hintText: "Ej: ABCD1234",
        ),
      ],
    );
  }

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: children,
    );
  }
}
