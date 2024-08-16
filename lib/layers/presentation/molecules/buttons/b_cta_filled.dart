import 'package:flutter/material.dart';
import 'package:ser_manos/layers/presentation/molecules/buttons/styles/bs_cta.dart';
import 'package:ser_manos/layers/presentation/tokens/colors.dart';
import 'package:ser_manos/layers/presentation/tokens/typographies/t_button.dart';

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
