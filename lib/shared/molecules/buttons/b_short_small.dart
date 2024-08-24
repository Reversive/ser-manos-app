import 'package:ser_manos/shared/molecules/buttons/b_short.dart';
import 'package:flutter/material.dart';

class BShortSmall extends BShort {
  BShortSmall(
    super.text, {
    super.key,
    super.onPressed,
    super.disabled = false,
    super.icon,
  }) : super(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        );
}
