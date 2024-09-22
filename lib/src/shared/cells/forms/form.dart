import 'package:flutter/material.dart';
import 'package:ser_manos/src/features/profile/domain/gender.dart';
import 'package:ser_manos/src/shared/cells/cards/card.dart';
import 'package:ser_manos/src/shared/molecules/inputs/calendar_input.dart';
import 'package:ser_manos/src/shared/molecules/inputs/password_input.dart';
import 'package:ser_manos/src/shared/molecules/inputs/text_input.dart';
import 'package:ser_manos/src/shared/molecules/inputs/validators/validator.dart';
import 'package:ser_manos/src/shared/tokens/gap.dart';
import 'package:ser_manos/src/shared/tokens/typography.dart';

class SMForm extends StatelessWidget {
  const SMForm({super.key, required this.children});

  factory SMForm.contactDetails() {
    return SMForm(
      children: [
        SMTypography.headline01("Datos de contacto"),
        const SMGap.vertical(height: 24.0),
        SMTypography.subtitle01(
            "Estos datos serán compartidos con la organización para ponerse en contacto contigo"),
        const SMGap.vertical(height: 24.0),
        const SMTextInput(
          labelText: "Teléfono",
          hintText: "Ej: +541178445459",
          validator: SMValidator.required,
        ),
        const SMGap.vertical(height: 24.0),
        const SMTextInput(
          validator: SMValidator.email,
          labelText: "Mail",
          hintText: "Ej: mimail@mail.com",
        )
      ],
    );
  }

  factory SMForm.personalDetails({
    required Gender groupValue,
    required void Function(Gender?) onChanged,
  }) {
    return SMForm(
      children: [
        SMTypography.headline01("Datos de perfil"),
        const SMGap.vertical(height: 24),
        const SMCalendarInput(
          hintText: "DD/MM/YYYY",
          labelText: "Fecha de nacimiento",
        ),
        const SMGap.vertical(height: 24),
        SMCard.input(
          title: "Información de perfil",
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        const SMGap.vertical(height: 24),
        SMCard.profile(),
      ],
    );
  }

  factory SMForm.signIn() {
    return const SMForm(
      children: [
        SMTextInput(
          labelText: "Email",
          validator: SMValidator.email,
        ),
        SMGap.vertical(height: 24),
        SMPasswordInput(
          labelText: "Contraseña",
        ),
      ],
    );
  }

  factory SMForm.signUp() {
    return const SMForm(
      children: [
        SMTextInput(
          labelText: "Nombre",
          validator: SMValidator.required,
          hintText: "Ej: Juan",
        ),
        SMGap.vertical(height: 24),
        SMTextInput(
          labelText: "Apellido",
          hintText: "Ej: Barcena",
          validator: SMValidator.required,
        ),
        SMGap.vertical(height: 24),
        SMTextInput(
          labelText: "Email",
          validator: SMValidator.email,
          hintText: "Ej: juanbarcena@mail.com",
        ),
        SMGap.vertical(height: 24),
        SMPasswordInput(
          labelText: "Contraseña",
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
