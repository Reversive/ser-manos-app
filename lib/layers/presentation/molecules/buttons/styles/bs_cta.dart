import 'package:flutter/material.dart';
import 'package:ser_manos/layers/presentation/molecules/buttons/styles/bs_base.dart';
import 'package:ser_manos/layers/presentation/tokens/colors.dart';

final class BSCta extends BSBase {
  BSCta({
    required bool filled,
    required bool disabled,
  }) : super(
          backgroundColor: filled
              ? disabled
                  ? WidgetStateProperty.all<Color>(SMColors.neutral25)
                  : WidgetStateProperty.all<Color>(SMColors.primary100)
              : null,
          padding: WidgetStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        );
}
