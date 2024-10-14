import 'package:flutter/material.dart';
import 'package:ser_manos/src/core/theme/colors.dart';
import 'package:ser_manos/src/design-system/molecules/buttons/button.dart';
import 'package:ser_manos/src/design-system/tokens/gap.dart';
import 'package:ser_manos/src/design-system/tokens/shadows.dart';
import 'package:ser_manos/src/design-system/tokens/typography.dart';

class SMModal extends Dialog {
  SMModal({
    super.key,
    String? subtitle,
    required String title,
    required String cancelText,
    required String confirmText,
    required BuildContext context,
    required VoidCallback onConfirm,
  }) : super(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              boxShadow: SMShadows.shadow3,
              color: SMColors.neutral0,
            ),
            width: 280,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SMTypography.headline02(title),
                if (subtitle != null) SMTypography.subtitle01(subtitle),
                const SMGap.vertical(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SMButton.text(
                      cancelText,
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SMGap.horizontal(width: 8),
                    SMButton.text(
                      confirmText,
                      onPressed: onConfirm,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
}
