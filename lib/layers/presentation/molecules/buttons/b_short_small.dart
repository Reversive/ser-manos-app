import 'package:ser_manos/layers/presentation/molecules/buttons/b_short.dart';
import 'package:flutter/material.dart';

class BShortSmall extends BShort {
  BShortSmall(
    super.text, {
    super.key,
    super.onPressed,
    super.disabled = false,
    required super.icon,
  }) : super(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        );
}
