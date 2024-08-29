import 'package:flutter/material.dart';
import 'package:ser_manos/src/shared/atoms/icon.dart';
import 'package:ser_manos/src/core/theme/colors.dart';
import 'package:ser_manos/src/shared/tokens/gap.dart';
import 'package:ser_manos/src/shared/tokens/shadows.dart';
import 'package:ser_manos/src/shared/tokens/typography.dart';

enum ButtonType {
  filled,
  text,
  floating,
}

class SMButton extends StatelessWidget {
  const SMButton(
    this.text, {
    super.key,
    this.onPressed,
    this.style,
    this.disabled = false,
    required this.type,
    required this.child,
  });

  factory SMButton.short(
    String text, {
    Key? key,
    SMIcon? icon,
    EdgeInsets? padding,
    bool disabled = false,
    void Function()? onPressed,
  }) {
    return SMButton(
      text,
      key: key,
      disabled: disabled,
      type: ButtonType.filled,
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        padding: padding ?? const EdgeInsets.all(12),
        backgroundColor: disabled ? SMColors.neutral25 : SMColors.primary100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null) icon,
          if (icon != null) const SMGap.horizontal(width: 8),
          SMTypography.button(
            text,
            color: disabled ? SMColors.neutral50 : SMColors.neutral0,
          ),
        ],
      ),
    );
  }

  factory SMButton.shortSmall(
    String text, {
    Key? key,
    SMIcon? icon,
    bool disabled = false,
    void Function()? onPressed,
  }) {
    return SMButton.short(
      text,
      key: key,
      icon: icon,
      disabled: disabled,
      onPressed: onPressed,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
    );
  }

  factory SMButton.text(
    String text, {
    Key? key,
    bool disabled = false,
    void Function()? onPressed,
  }) {
    return SMButton(
      text,
      key: key,
      type: ButtonType.text,
      disabled: disabled,
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: SMTypography.button(
        text,
        color: disabled ? SMColors.neutral50 : SMColors.primary100,
      ),
    );
  }

  factory SMButton.filled(
    String text, {
    Key? key,
    bool disabled = false,
    void Function()? onPressed,
  }) {
    return SMButton(
      text,
      key: key,
      type: ButtonType.filled,
      disabled: disabled,
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: disabled ? SMColors.neutral25 : SMColors.primary100,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: SMTypography.button(
        text,
        color: disabled ? SMColors.neutral50 : SMColors.neutral0,
      ),
    );
  }

  factory SMButton.floating({
    Key? key,
    required IconData icon,
    required void Function() onPressed,
    bool disabled = false,
  }) {
    return SMButton(
      '',
      key: key,
      type: ButtonType.floating,
      child: IconButton(
        style: IconButton.styleFrom(
          backgroundColor: disabled ? SMColors.neutral10 : SMColors.primary10,
          padding: const EdgeInsets.all(12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        icon: SMIcon(
          icon: icon,
          disabled: disabled,
          active: true,
        ),
        onPressed: onPressed,
      ),
    );
  }

  final String text;
  final bool disabled;
  final ButtonType type;
  final ButtonStyle? style;
  final Widget child;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return type == ButtonType.filled
        ? FilledButton(
            key: key,
            onPressed: disabled ? null : onPressed,
            style: style,
            child: child,
          )
        : type == ButtonType.text
            ? TextButton(
                key: key,
                onPressed: disabled ? null : onPressed,
                style: style,
                child: child,
              )
            : Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: SMColors.transparent,
                  boxShadow: SMShadows.shadow3,
                ),
                child: child,
              );
  }
}
