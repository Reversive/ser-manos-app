import 'package:flutter/material.dart';
import 'package:ser_manos/layers/presentation/tokens/colors.dart';
import 'package:ser_manos/layers/presentation/tokens/typographies/t_body01.dart';
import 'package:ser_manos/layers/presentation/tokens/typographies/t_overline.dart';

class CLabeledContent extends Column {
  CLabeledContent({super.key, required String label, required String content})
      : super(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TOverline(
              label.toUpperCase(),
              color: SMColors.neutral75,
            ),
            TBody1(content)
          ],
        );
}
