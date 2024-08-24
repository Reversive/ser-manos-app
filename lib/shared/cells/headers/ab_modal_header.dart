import 'package:flutter/material.dart';
import 'package:ser_manos/shared/cells/headers/styles/suos_light.dart';
import 'package:ser_manos/shared/tokens/colors.dart';

class ABModalHeader extends AppBar {
  ABModalHeader({
    super.key,
  }) : super(
          systemOverlayStyle: const SUOSLight(),
          leading: const CloseButton(
            color: SMColors.neutral75,
          ),
        );
}
