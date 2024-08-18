import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ser_manos/layers/presentation/atoms/icon.dart';
import 'package:ser_manos/layers/presentation/molecules/inputs/tff_base.dart';
import 'package:ser_manos/layers/presentation/molecules/inputs/formatters/tif_date.dart';
import 'package:ser_manos/layers/presentation/tokens/colors.dart';
import 'package:ser_manos/layers/presentation/tokens/decorations/id_base.dart';
import 'package:ser_manos/layers/presentation/tokens/typographies/styles/ts_body02.dart';

class TffCalendar extends TFFBase {
  TffCalendar({
    super.key,
    super.enabled,
    super.validator,
    required super.controller,
    required String hint,
    required String label,
    required BuildContext context,
  }) : super(
          inputFormatters: [
            TIFDate(),
          ],
          keyboardType: TextInputType.datetime,
          decoration: IDBase(
            labelText: label,
            hintText: hint,
            helperText: controller!.text.isNotEmpty ? "Día / Mes / Año" : null,
            helperStyle: const TSBody2(
              color: SMColors.neutral75,
            ),
            suffixIcon: IconButton(
              onPressed: () async {
                // https://stackoverflow.com/questions/54127847/flutter-how-to-display-datepicker-when-textformfield-is-clicked
                FocusScope.of(context).requestFocus(FocusNode());
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1930),
                  lastDate: DateTime.now(),
                );
                if (picked != null) {
                  // https://stackoverflow.com/questions/50758072/date-time-format-in-flutter-dd-mm-yyyy-hhmm
                  final f = DateFormat('dd/MM/yyyy');
                  controller.text = f.format(picked);
                }
              },
              icon: const SMIcon(
                icon: Icons.calendar_month,
                active: true,
              ),
            ),
          ),
        );
}
