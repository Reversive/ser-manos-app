import 'package:flutter/material.dart';
import 'package:ser_manos/layers/presentation/molecules/inputs/text_input.dart';
import 'package:ser_manos/layers/presentation/tokens/typographies/t_headline01.dart';
import 'package:ser_manos/layers/presentation/tokens/typographies/t_subtitle01.dart';

class CContactDetails extends Column {
  CContactDetails({
    super.key,
    required TextEditingController phoneController,
    required TextEditingController mailController,
    required Function(String?) phoneValidator,
    required Function(String?) mailValidator,
  }) : super(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            THeadline1("Datos de contacto"),
            const SizedBox(height: 24.0),
            TSubtitle1(
                "Estos datos serán compartidos con la organización para ponerse en contacto contigo"),
            const SizedBox(height: 24.0),
            TextInput(
              controller: phoneController,
              labelText: "Teléfono",
              hintText: "Ej: +541178445459",
              validator: phoneValidator,
            ),
            const SizedBox(height: 24.0),
            TextInput(
              controller: mailController,
              validator: mailValidator,
              labelText: "Mail",
              hintText: "Ej: mimail@mail.com",
            )
          ],
        );
}
