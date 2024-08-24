import 'package:flutter/material.dart';
import 'package:ser_manos/shared/molecules/buttons/b_cta_text.dart';
import 'package:ser_manos/shared/tokens/decorations/bd_card.dart';
import 'package:ser_manos/shared/tokens/shadows.dart';
import 'package:ser_manos/shared/tokens/typographies/t_headline02.dart';
import 'package:ser_manos/shared/tokens/typographies/t_subtitle01.dart';

class DModal extends Dialog {
  DModal({
    super.key,
    required String subtitle,
    required String title,
    required String cancelText,
    required String confirmText,
    required BuildContext context,
    required VoidCallback onConfirm,
  }) : super(
          child: Container(
            decoration: BDCard(
              radius: 4,
              boxShadow: SMShadows.shadow3,
            ),
            width: 280,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TSubtitle1(subtitle),
                THeadline2(title),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BCtaText(
                      cancelText,
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 8),
                    BCtaText(
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
