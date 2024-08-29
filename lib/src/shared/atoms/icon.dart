import 'package:flutter/material.dart';
import 'package:ser_manos/src/core/theme/colors.dart';

abstract final class BaseIcon extends Icon {
  const BaseIcon({
    super.key,
    required IconData icon,
    double size = 24,
    bool active = false,
    bool disabled = false,
    Color disabledColor = SMColors.neutral25,
    Color activeColor = SMColors.primary100,
    Color enabledColor = SMColors.neutral75,
  }) : super(
          icon,
          size: size,
          color: disabled
              ? disabledColor
              : active
                  ? activeColor
                  : enabledColor,
        );
}

final class SMIcon extends BaseIcon {
  const SMIcon({
    super.key,
    required super.icon,
    super.size,
    super.active,
    super.disabled,
    super.disabledColor,
    super.activeColor,
    super.enabledColor,
  });

  factory SMIcon.secondary({required icon}) {
    return SMIcon(
      icon: icon,
      enabledColor: SMColors.secondary200,
      disabledColor: SMColors.secondary80,
    );
  }

  factory SMIcon.error() {
    return const SMIcon(
      icon: Icons.error,
      enabledColor: SMColors.error100,
    );
  }
}
