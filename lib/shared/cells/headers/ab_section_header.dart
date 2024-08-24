import 'package:flutter/material.dart';
import 'package:ser_manos/shared/cells/headers/styles/suos_secondary.dart';
import 'package:ser_manos/shared/tokens/colors.dart';
import 'package:ser_manos/shared/tokens/typographies/t_subtitle01.dart';

class ABSectionHeader extends AppBar {
  ABSectionHeader({
    super.key,
    bool hasBackButton = true,
    required String subtitle,
  }) : super(
          systemOverlayStyle: const SUOSSecondary(),
          backgroundColor: SMColors.secondary90,
          leading: hasBackButton
              ? const BackButton(
                  color: SMColors.neutral0,
                )
              : null,
          centerTitle: true,
          title: TSubtitle1(
            subtitle,
            color: SMColors.neutral0,
          ),
        );
}
