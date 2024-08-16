import 'package:flutter/material.dart';
import 'package:ser_manos/layers/presentation/tokens/colors.dart';
import 'package:ser_manos/layers/presentation/tokens/text_styles/ts_base.dart';

final class TSHeadline1 extends TSBase {
  const TSHeadline1({
    super.fontSize = 24,
    super.color = SMColors.neutral100,
    super.fontWeight = FontWeight.w400,
    super.height = 24,
    super.letterSpacing = 0.18,
  });
}