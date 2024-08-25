import 'package:flutter/material.dart';
import 'package:ser_manos/shared/cells/headers/styles/suos_light.dart';
import 'package:ser_manos/shared/tokens/colors.dart';

class ABModalHeader extends AppBar {
  ABModalHeader({
    super.key,
    bool implyLeading = true,
  }) : super(
          systemOverlayStyle: const SUOSLight(),
          leading: implyLeading
              ? const CloseButton(
                  color: SMColors.neutral75,
                )
              : null,
        );
}
