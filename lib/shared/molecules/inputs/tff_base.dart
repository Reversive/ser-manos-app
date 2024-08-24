import 'package:flutter/material.dart';
import 'package:ser_manos/shared/tokens/colors.dart';
import 'package:ser_manos/shared/tokens/typographies/styles/ts_subtitle01.dart';

class TFFBase extends TextFormField {
  TFFBase({
    super.key,
    required super.controller,
    required super.decoration,
    super.enabled,
    super.obscureText,
    super.validator,
    super.onTap,
    super.keyboardType,
    super.inputFormatters,
    super.focusNode,
    super.cursorColor,
    super.onChanged,
  }) : super(
          style: const TSSubtitle1(
            color: SMColors.neutral100,
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
        );
}
