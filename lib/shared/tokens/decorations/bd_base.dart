import 'package:flutter/material.dart';
import 'package:ser_manos/shared/tokens/colors.dart';

abstract class BDBase extends BoxDecoration {
  const BDBase({
    super.color = SMColors.neutral0,
    super.boxShadow,
    super.borderRadius,
    super.border,
  });
}