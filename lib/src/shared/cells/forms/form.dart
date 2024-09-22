import 'package:flutter/material.dart';
import 'package:ser_manos/src/features/profile/domain/gender.dart';
import 'package:ser_manos/src/shared/cells/cards/card.dart';
import 'package:ser_manos/src/shared/molecules/inputs/calendar_input.dart';
import 'package:ser_manos/src/shared/molecules/inputs/password_input.dart';
import 'package:ser_manos/src/shared/molecules/inputs/text_input.dart';
import 'package:ser_manos/src/shared/tokens/gap.dart';
import 'package:ser_manos/src/shared/tokens/typography.dart';

class SMForm extends StatelessWidget {
  const SMForm({super.key, required this.children});

  factory SMForm.contactDetails({
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
          labelText: "Teléfono",
          hintText: "Ej: +541178445459",
          validator: phoneValidator,
        ),
        const SMGap.vertical(height: 24.0),
        SMTextInput(
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
    required Gender groupValue,
    required void Function(Gender?) onChanged,
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
        SMCard.input(title: "Información de perfil", groupValue: groupValue, onChanged: onChanged,),
        const SMGap.vertical(height: 24),
        SMCard.profile(),
      ],
    );
  }

  factory SMForm.signIn({
    required TextEditingController passwordController,
    required Function(String?) emailValidator,
    required Function(String?) passwordValidator,
  }) {
    return SMForm(
      children: [
        SMTextInput(
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
    required TextEditingController passwordController,
    required Function(String?) nameValidator,
    required Function(String?) surnameValidator,
    required Function(String?) emailValidator,
    required Function(String?) passwordValidator,
  }) {
    return SMForm(
      children: [
        SMTextInput(
          labelText: "Nombre",
          validator: nameValidator,
          hintText: "Ej: Juan",
        ),
        const SMGap.vertical(height: 24),
        SMTextInput(
          labelText: "Apellido",
          validator: surnameValidator,
          hintText: "Ej: Barcena",
        ),
        const SMGap.vertical(height: 24),
        SMTextInput(
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
