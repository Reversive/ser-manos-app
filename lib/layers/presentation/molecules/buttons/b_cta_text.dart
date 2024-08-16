import 'package:flutter/material.dart';
import 'package:ser_manos/layers/presentation/molecules/buttons/styles/bs_cta.dart';
import 'package:ser_manos/layers/presentation/tokens/colors.dart';
import 'package:ser_manos/layers/presentation/tokens/typographies/t_button.dart';

final class BCtaText extends TextButton {
  BCtaText(
    String text, {
    super.key,
    bool disabled = false,
    super.onPressed,
  }) : super(
          style: BSCta(
            filled: false,
            disabled: disabled,
          ),
          child: TButton(
            text,
            color: disabled ? SMColors.neutral50 : SMColors.primary100,
          ),
        );
}
