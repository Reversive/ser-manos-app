import 'package:flutter/material.dart';
import 'package:ser_manos/src/core/theme/colors.dart';
import 'package:ser_manos/src/shared/tokens/typography.dart';

class BaseInputDecoration extends InputDecoration {
  BaseInputDecoration({
    super.labelText,
    super.hintText,
    super.helperText,
    super.suffixIcon,
    super.floatingLabelBehavior,
    super.labelStyle,
  }) : super(
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: SMColors.neutral50,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: SMColors.neutral75,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: SMColors.secondary200,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          hintStyle: SMTypography.subtitle01Style(
            color: SMColors.neutral50,
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: SMColors.error100,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          errorStyle: SMTypography.body02Style(
            color: SMColors.error100,
          ),
          helperStyle: SMTypography.captionStyle(
            color: SMColors.neutral75,
          ),
        );
}
