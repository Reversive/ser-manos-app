import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ser_manos/src/core/theme/colors.dart';
import 'package:ser_manos/src/design-system/atoms/icon.dart';
import 'package:ser_manos/src/design-system/molecules/inputs/base_input.dart';
import 'package:ser_manos/src/design-system/tokens/shadows.dart';
import 'package:ser_manos/src/design-system/tokens/typography.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SMSearchInput extends HookWidget {
  const SMSearchInput({
    super.key,
    this.onChanged,
    required this.onIconPressed,
    required this.suffixIcon,
    required this.controller,
  });
  final Function() onIconPressed;
  final IconData suffixIcon;
  final TextEditingController controller;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final FocusNode focusNode = useFocusNode();
    final bool isEmpty =
        useListenableSelector(controller, () => controller.text.isEmpty);

    Widget? buildSuffixIcon(FocusNode focusNode) {
      if (isEmpty && focusNode.hasFocus) {
        return null;
      }
      if (!isEmpty) {
        return IconButton(
          onPressed: () {
            focusNode.unfocus();
            controller.clear();
            onChanged?.call('');
          },
          icon: const SMIcon(
            icon: Icons.clear,
          ),
        );
      }
      return IconButton(
        icon: SMIcon(
          icon: suffixIcon,
          active: true,
        ),
        onPressed: onIconPressed,
      );
    }

    return Container(
      decoration: BoxDecoration(
        boxShadow: SMShadows.shadow1,
        borderRadius: BorderRadius.circular(2.0),
        color: SMColors.neutral0,
      ),
      child: BaseInput(
        focusNode: focusNode,
        controller: controller,
        onChanged: onChanged,
        validator: (value) => null,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
          suffixIcon: buildSuffixIcon(focusNode),
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          prefixIcon: const SMIcon(
            icon: Icons.search,
          ),
          hintText: AppLocalizations.of(context)!.search,
          hintStyle: SMTypography.subtitle01Style(),
        ),
      ),
    );
  }
}
