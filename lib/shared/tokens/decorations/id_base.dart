import 'package:flutter/material.dart';
import 'package:ser_manos/shared/tokens/colors.dart';
import 'package:ser_manos/shared/tokens/typographies/styles/ts_body02.dart';
import 'package:ser_manos/shared/tokens/typographies/styles/ts_caption.dart';
import 'package:ser_manos/shared/tokens/typographies/styles/ts_subtitle01.dart';

class IDBase extends InputDecoration {
  IDBase({
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
          hintStyle: const TSSubtitle1(
            color: SMColors.neutral50,
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: SMColors.error100,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          errorStyle: const TSBody2(
            color: SMColors.error100,
          ),
          helperStyle: const TSCaption(
            color: SMColors.neutral75,
          ),
        );
}
