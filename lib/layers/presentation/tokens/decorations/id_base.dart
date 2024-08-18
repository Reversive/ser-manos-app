import 'package:flutter/material.dart';
import 'package:ser_manos/layers/presentation/tokens/colors.dart';
import 'package:ser_manos/layers/presentation/tokens/typographies/styles/ts_body02.dart';
import 'package:ser_manos/layers/presentation/tokens/typographies/styles/ts_caption.dart';
import 'package:ser_manos/layers/presentation/tokens/typographies/styles/ts_subtitle01.dart';

class IDBase extends InputDecoration {
  const IDBase({
    super.labelText,
    super.hintText,
  }) : super(
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: SMColors.neutral50,
            ),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: SMColors.neutral75,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: SMColors.secondary100,
            ),
          ),
          labelStyle: const TSSubtitle1(
            color: SMColors.neutral75,
          ),
          floatingLabelStyle: const TSCaption(
            color: SMColors.neutral75,
          ),
          hintStyle: const TSSubtitle1(
            color: SMColors.neutral50,
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: SMColors.error100,
            ),
          ),
          errorStyle: const TSBody2(
            color: SMColors.error100,
          ),
        );
}
