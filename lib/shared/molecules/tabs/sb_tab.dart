import 'package:flutter/material.dart';
import 'package:ser_manos/shared/tokens/colors.dart';
import 'package:ser_manos/shared/tokens/typographies/t_button.dart';

class SBTab extends SizedBox {
  SBTab({
    super.key,
    required VoidCallback onPressed,
    required String tabText,
    bool isActive = false,
  }) : super(
            height: 52,
            child: FilledButton(
              onPressed: onPressed,
              style: ButtonStyle(
                padding: WidgetStateProperty.all<EdgeInsets>(
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 8)),
                backgroundColor: isActive
                    ? WidgetStateProperty.all<Color>(SMColors.secondary200)
                    : WidgetStateProperty.all<Color>(SMColors.secondary100),
                shape:
                    WidgetStateProperty.all<LinearBorder>(const LinearBorder()),
              ),
              child: TButton(
                tabText,
                color: isActive ? SMColors.neutral0 : SMColors.neutral25,
              ),
            ));
}
