import 'package:flutter/material.dart';
import 'package:ser_manos/shared/tokens/colors.dart';

abstract class TBase extends Text {
  const TBase(
    super.data, {
    super.key,
    super.style,
    super.textAlign,
    Color color = SMColors.neutral100,
  });
}
