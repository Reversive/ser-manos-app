import 'package:flutter/material.dart';
import 'package:ser_manos/layers/presentation/atoms/icon.dart';
import 'package:ser_manos/layers/presentation/molecules/buttons/styles/bs_short.dart';
import 'package:ser_manos/layers/presentation/tokens/colors.dart';
import 'package:ser_manos/layers/presentation/tokens/typographies/t_button.dart';

class BShort extends FilledButton {
  BShort(
    String text, {
    super.key,
    super.onPressed,
    bool disabled = false,
    EdgeInsets padding = const EdgeInsets.all(12),
    required SMIcon icon,
  }) : super(
          style: BSSHort(
            disabled: disabled,
            padding: WidgetStateProperty.all<EdgeInsets>(
              padding,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon,
              const SizedBox(width: 8),
              TButton(
                text,
                color: disabled ? SMColors.neutral50 : SMColors.neutral0,
              ),
            ],
          ),
        );
}