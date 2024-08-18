import 'package:flutter/material.dart';
import 'package:ser_manos/layers/presentation/tokens/colors.dart';
import 'package:ser_manos/layers/presentation/tokens/typographies/styles/ts_subtitle01.dart';

class TFFBase extends TextFormField {
  TFFBase({
    super.key,
    super.controller,
    required InputDecoration decoration,
    super.enabled,
    super.obscureText,
    super.validator,
    super.onTap,
    super.keyboardType,
    super.inputFormatters,
  }) : super(
          decoration: decoration,
          style: const TSSubtitle1(
            color: SMColors.neutral100,
          ),
        );
}
