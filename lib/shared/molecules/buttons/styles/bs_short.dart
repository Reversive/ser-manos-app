import 'package:flutter/material.dart';
import 'package:ser_manos/shared/molecules/buttons/styles/bs_base.dart';
import 'package:ser_manos/shared/tokens/colors.dart';

class BSSHort extends BSBase {
  BSSHort({required bool disabled, super.padding})
      : super(
          backgroundColor: disabled
              ? WidgetStateProperty.all<Color>(SMColors.neutral25)
              : WidgetStateProperty.all<Color>(SMColors.primary100),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        );
}
