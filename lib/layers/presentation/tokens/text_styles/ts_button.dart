import 'package:flutter/material.dart';
import 'package:ser_manos/layers/presentation/tokens/colors.dart';
import 'package:ser_manos/layers/presentation/tokens/text_styles/ts_base.dart';

final class TSButton extends TSBase {
  const TSButton({
    super.fontSize = 14,
    super.color = SMColors.neutral100,
    super.fontWeight = FontWeight.w500,
    super.height = 20,
    super.letterSpacing = 0.1,
  });
}
