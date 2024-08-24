import 'package:flutter/material.dart';
import 'package:ser_manos/shared/molecules/buttons/styles/bs_cta.dart';
import 'package:ser_manos/shared/tokens/colors.dart';
import 'package:ser_manos/shared/tokens/typographies/t_button.dart';

final class BCtaFilled extends FilledButton {
  BCtaFilled(
    String text, {
    super.key,
    bool disabled = false,
    super.onPressed,
  }) : super(
          style: BSCta(
            filled: true,
            disabled: disabled,
          ),
          child: TButton(
            text,
            color: disabled ? SMColors.neutral50 : SMColors.neutral0,
          ),
        );
}
