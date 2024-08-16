import 'package:flutter/material.dart';
import 'package:ser_manos/layers/presentation/tokens/colors.dart';

abstract class TBase extends Text {
  const TBase(
    super.data, {
    super.key,
    super.style,
    Color color = SMColors.neutral100,
  });
}
