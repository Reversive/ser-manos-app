import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ser_manos/src/design-system/atoms/icon.dart';
import 'package:ser_manos/src/core/theme/colors.dart';
import 'package:ser_manos/src/design-system/molecules/inputs/decorations/base_input_decoration.dart';
import 'package:ser_manos/src/design-system/tokens/typography.dart';

class BaseInput extends HookWidget {
  final TextEditingController controller;
  final String? helperText;
  final Widget? suffixIcon;
  final bool permaShowSuffixIcon;
  final Function()? onSuffixIconPressed;
  final InputDecoration? decoration;
  final String? hintText;
  final String? labelText;
  final bool enabled;
  final Function(String?) validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final bool obscureText;
  final bool shouldLoseFocusOnSuffixIconPressed;
  final Function(String)? onChanged;

  const BaseInput({
    super.key,
    required this.controller,
    required this.validator,
    this.helperText,
    this.suffixIcon,
    this.permaShowSuffixIcon = false,
    this.onSuffixIconPressed,
    this.decoration,
    this.hintText,
    this.labelText,
    this.enabled = true,
    this.keyboardType,
    this.inputFormatters,
    this.focusNode,
    this.obscureText = false,
    this.shouldLoseFocusOnSuffixIconPressed = true,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();
    final validationFailed = useState(false);
    final isEmpty =
        useListenableSelector(controller, () => controller.text.isEmpty);

    void onInputChanged(value) {
      validationFailed.value = validator(value) != null;
      onChanged?.call(value);
    }

    IconButton? buildSuffixIcon(FocusNode focusNode) {
      if (suffixIcon == null) {
        return null;
      }

      if (!isEmpty && !focusNode.hasFocus && !permaShowSuffixIcon) {
        return null;
      }

      return permaShowSuffixIcon
          ? IconButton(
              onPressed: () async {
                if (onSuffixIconPressed != null) {
                  await onSuffixIconPressed!();
                }
                if (shouldLoseFocusOnSuffixIconPressed) {
                  focusNode.unfocus();
                }
                onInputChanged(controller.text);
              },
              icon: suffixIcon!,
            )
          : controller.text.isNotEmpty
              ? IconButton(
                  onPressed: () async {
                    if (onSuffixIconPressed != null) {
                      await onSuffixIconPressed!();
                    }
                    if (shouldLoseFocusOnSuffixIconPressed) {
                      focusNode.unfocus();
                    }
                    onInputChanged(controller.text);
                  },
                  icon: suffixIcon!,
                )
              : null;
    }

    return TextFormField(
      style: SMTypography.subtitle01Style(),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: decoration ??
          BaseInputDecoration(
            hintText: hintText,
            labelText: labelText,
            helperText: focusNode.hasFocus ? helperText : null,
            suffixIcon: validationFailed.value
                ? SMIcon.error()
                : buildSuffixIcon(focusNode),
            floatingLabelBehavior: hintText != null
                ? FloatingLabelBehavior.always
                : FloatingLabelBehavior.auto,
            labelStyle: validationFailed.value
                ? SMTypography.captionStyle(
                    color: SMColors.error100,
                  )
                : focusNode.hasFocus
                    ? SMTypography.captionStyle(
                        color: SMColors.secondary200,
                      )
                    : SMTypography.captionStyle(
                        color: SMColors.neutral75,
                      ),
          ),
      controller: controller,
      enabled: enabled,
      focusNode: focusNode,
      onChanged: onInputChanged,
      validator: (value) => validator(value),
      textInputAction: TextInputAction.next,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      obscureText: obscureText,
    );
  }
}
