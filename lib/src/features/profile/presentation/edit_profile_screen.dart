import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ser_manos/src/core/theme/colors.dart';
import 'package:ser_manos/src/features/profile/domain/gender.dart';
import 'package:ser_manos/src/shared/cells/cards/card.dart';
import 'package:ser_manos/src/shared/cells/headers/header.dart';
import 'package:ser_manos/src/shared/molecules/buttons/button.dart';
import 'package:ser_manos/src/shared/molecules/inputs/calendar_input.dart';
import 'package:ser_manos/src/shared/molecules/inputs/text_input.dart';
import 'package:ser_manos/src/shared/tokens/fill.dart';
import 'package:ser_manos/src/shared/tokens/gap.dart';
import 'package:ser_manos/src/shared/tokens/grid.dart';
import 'package:ser_manos/src/shared/tokens/typography.dart';

class EditProfileScreen extends HookWidget {
  static const String route = '/home/profile/edit';
  static const String routeName = 'profile_edit';
  EditProfileScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _calendarController = TextEditingController();

  String? mailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "El mail es requerido";
    }
    if (!value.contains("@")) {
      return "El mail no es válido";
    }
    return null;
  }

  String? calendarValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "La fecha es requerida";
    }
    return null;
  }

  String? phoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "El teléfono es requerido";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final isFormValid = useState(false);
    final currentGender = useState(Gender.male);
    return Scaffold(
      appBar: SMHeader.modal(),
      backgroundColor: SMColors.neutral0,
      body: Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 32),
        child: SMGrid(
          child: SingleChildScrollView(
            child: Form(
              onChanged: () => isFormValid.value =
                  _formKey.currentState?.validate() ?? false,
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SMTypography.headline01("Datos de perfil"),
                  const SMGap.vertical(height: 24),
                  SMCalendarInput(
                    controller: _calendarController,
                    validator: calendarValidator,
                    hintText: "DD/MM/YYYY",
                    labelText: "Fecha de nacimiento",
                  ),
                  const SMGap.vertical(height: 24),
                  SMCard.input(
                    title: "Información de perfil",
                    groupValue: currentGender.value,
                    onChanged: (Gender? value) =>
                        currentGender.value = value ?? Gender.male,
                  ),
                  const SMGap.vertical(height: 24),
                  SMCard.profile(),
                  const SMGap.vertical(height: 32),
                  SMTypography.headline01("Datos de contacto"),
                  const SMGap.vertical(height: 24),
                  SMTypography.subtitle01(
                    "Estos datos serán compartidos con la organización para ponerse en contacto contigo",
                  ),
                  const SMGap.vertical(height: 24),
                  SMTextInput(
                    labelText: "Teléfono",
                    hintText: "+5491141625944",
                    validator: phoneValidator,
                  ),
                  const SMGap.vertical(height: 24),
                  SMTextInput(
                    labelText: "Mail",
                    hintText: "mimail@mail.com",
                    validator: mailValidator,
                  ),
                  const SMGap.vertical(height: 32),
                  SMFill.horizontal(
                    child: SMButton.filled(
                      "Guardar datos",
                      onPressed: () {},
                      disabled: !isFormValid.value,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
