import 'package:flutter/material.dart';
import 'package:ser_manos/layers/presentation/molecules/buttons/styles/bs_base.dart';
import 'package:ser_manos/layers/presentation/tokens/colors.dart';

class BSFloating extends BSBase {
  BSFloating({required bool disabled})
      : super(
          backgroundColor: disabled
              ? WidgetStateProperty.all<Color>(
                  SMColors.neutral10,
                )
              : WidgetStateProperty.all<Color>(
                  SMColors.primary10,
                ),
          padding: WidgetStateProperty.all<EdgeInsets>(
            const EdgeInsets.all(12),
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        );
}
