import 'package:flutter/material.dart';
import 'package:ser_manos/src/design-system/cells/headers/styles/suos_base.dart';
import 'package:ser_manos/src/core/theme/colors.dart';

class SUOSSecondary extends SUOSBase {
  const SUOSSecondary()
      : super(
          statusBarColor: SMColors.secondary90,
          ib: Brightness.light,
          bb: Brightness.light,
        );
}
