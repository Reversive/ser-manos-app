import 'package:flutter/material.dart';
import 'package:ser_manos/layers/presentation/tokens/colors.dart';
import 'package:ser_manos/layers/presentation/tokens/text_styles/ts_base.dart';

final class TSOverline extends TSBase {
  const TSOverline({
    super.fontSize = 10,
    super.color = SMColors.neutral100,
    super.fontWeight = FontWeight.w500,
    super.height = 10,
    super.letterSpacing = 1.5,
  });
}