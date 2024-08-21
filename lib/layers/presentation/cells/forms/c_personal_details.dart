import 'package:flutter/material.dart';
import 'package:ser_manos/layers/presentation/cells/cards/c_input.dart';
import 'package:ser_manos/layers/presentation/cells/cards/c_profile.dart';
import 'package:ser_manos/layers/presentation/molecules/inputs/calendar_input.dart';
import 'package:ser_manos/layers/presentation/tokens/typographies/t_headline01.dart';

class CPersonalDetails extends Column {
  CPersonalDetails({
    super.key,
    required TextEditingController calendarController,
    required Function(String?) calendarValidator,
  }) : super(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            THeadline1("Datos de perfil"),
            const SizedBox(height: 24),
            CalendarInput(
              controller: calendarController,
              validator: calendarValidator,
              hintText: "DD/MM/YYYY",
              labelText: "Fecha de nacimiento",
            ),
            const SizedBox(height: 24),
            CInput(headingTitle: "Información de perfil"),
            const SizedBox(height: 24),
            CProfile(),
          ],
        );
}
