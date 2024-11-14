import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:ser_manos/src/design-system/atoms/icon.dart';
import 'package:ser_manos/src/design-system/molecules/inputs/base_input.dart';
import 'package:ser_manos/src/design-system/molecules/inputs/formatters/date_formatter.dart';
import 'package:ser_manos/src/design-system/molecules/inputs/validators/validator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SMCalendarInput extends HookWidget {
  const SMCalendarInput({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.controller,
  });

  final String hintText;
  final String labelText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    void onSuffixIconPressed() async {
      FocusScope.of(context).requestFocus(FocusNode());
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1930),
        lastDate: DateTime.now(),
      );

      if (picked != null) {
        final f = DateFormat('dd/MM/yyyy');
        controller.text = f.format(picked);
      }
    }

    return BaseInput(
      controller: controller,
      validator: (value) => SMValidator.required(value, context),
      keyboardType: TextInputType.datetime,
      hintText: hintText,
      labelText: labelText,
      helperText: AppLocalizations.of(context)!.calendarHelperText,
      permaShowSuffixIcon: true,
      onSuffixIconPressed: onSuffixIconPressed,
      suffixIcon: const SMIcon(
        icon: Icons.calendar_month,
        active: true,
      ),
      inputFormatters: [
        DateFormatter(),
      ],
    );
  }
}
