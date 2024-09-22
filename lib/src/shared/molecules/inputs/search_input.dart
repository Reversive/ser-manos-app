import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ser_manos/src/core/theme/colors.dart';
import 'package:ser_manos/src/shared/atoms/icon.dart';
import 'package:ser_manos/src/shared/molecules/inputs/base_input.dart';
import 'package:ser_manos/src/shared/tokens/shadows.dart';
import 'package:ser_manos/src/shared/tokens/typography.dart';

class SMSearchInput extends HookWidget {
  const SMSearchInput({
    super.key,
    required this.validator,
    required this.onIconPressed,
    required this.suffixIcon,
  });

  final Function(String?) validator;
  final Function() onIconPressed;
  final IconData suffixIcon;

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = useTextEditingController();
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
        validator: validator,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
          suffixIcon: buildSuffixIcon(focusNode),
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          prefixIcon: const SMIcon(
            icon: Icons.search,
          ),
          hintText: 'Buscar',
          hintStyle: SMTypography.subtitle01Style(),
        ),
      ),
    );
  }
}
