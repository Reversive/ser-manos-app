import 'package:flutter/material.dart';
import 'package:ser_manos/layers/presentation/tokens/colors.dart';
import 'package:ser_manos/layers/presentation/tokens/text_styles/ts_base.dart';

final class TSCaption extends TSBase {
  const TSCaption({
    super.fontSize = 12,
    super.color = SMColors.neutral100,
    super.fontWeight = FontWeight.w400,
    super.height = 16,
    super.letterSpacing = 0.4,
  });
}
