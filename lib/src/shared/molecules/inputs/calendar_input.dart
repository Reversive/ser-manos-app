import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:ser_manos/src/shared/atoms/icon.dart';
import 'package:ser_manos/src/shared/molecules/inputs/base_input.dart';
import 'package:ser_manos/src/shared/molecules/inputs/formatters/date_formatter.dart';

class SMCalendarInput extends HookWidget {
  const SMCalendarInput({
    super.key,
    required this.validator,
    required this.hintText,
    required this.labelText,
  });

  final Function(String?) validator;
  final String hintText;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = useTextEditingController();

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
      validator: validator,
      keyboardType: TextInputType.datetime,
      hintText: hintText,
      labelText: labelText,
      helperText: "Día / Mes / Año",
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
