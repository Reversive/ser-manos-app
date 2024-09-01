import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ser_manos/src/shared/atoms/icon.dart';
import 'package:ser_manos/src/shared/molecules/inputs/base_input.dart';
import 'package:ser_manos/src/shared/molecules/inputs/formatters/date_formatter.dart';

class SMCalendarInput extends StatefulWidget {
  const SMCalendarInput({
    super.key,
    required this.controller,
    required this.validator,
    required this.hintText,
    required this.labelText,
  });

  final TextEditingController controller;
  final Function(String?) validator;
  final String hintText;
  final String labelText;

  @override
  State<SMCalendarInput> createState() => _SMCalendarInputState();
}

class _SMCalendarInputState extends State<SMCalendarInput> {
  @override
  Widget build(BuildContext context) {
    return BaseInput(
      controller: widget.controller,
      validator: widget.validator,
      keyboardType: TextInputType.datetime,
      hintText: widget.hintText,
      labelText: widget.labelText,
      helperText: "Día / Mes / Año",
      permaShowSuffixIcon: true,
      onSuffixIconPressed: _onSuffixIconPressed,
      suffixIcon: const SMIcon(
        icon: Icons.calendar_month,
        active: true,
      ),
      inputFormatters: [
        DateFormatter(),
      ],
    );
  }

  void _onSuffixIconPressed() async {
    FocusScope.of(context).requestFocus(FocusNode());
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1930),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      final f = DateFormat('dd/MM/yyyy');
      widget.controller.text = f.format(picked);
    }
  }
}