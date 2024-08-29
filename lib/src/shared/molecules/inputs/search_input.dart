import 'package:flutter/material.dart';
import 'package:ser_manos/src/core/theme/colors.dart';
import 'package:ser_manos/src/shared/atoms/icon.dart';
import 'package:ser_manos/src/shared/molecules/inputs/base_input.dart';
import 'package:ser_manos/src/shared/tokens/shadows.dart';
import 'package:ser_manos/src/shared/tokens/typography.dart';

class SMSearchInput extends StatefulWidget {
  const SMSearchInput({
    super.key,
    required this.controller,
    required this.validator,
    required this.onIconPressed,
    required this.suffixIcon,
  });

  final TextEditingController controller;
  final Function(String?) validator;
  final Function() onIconPressed;
  final IconData suffixIcon;

  @override
  State<SMSearchInput> createState() => _SMSearchInputState();
}

class _SMSearchInputState extends State<SMSearchInput> {
  final FocusNode _focusNode = FocusNode();
  void _setState() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_setState);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_setState);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: SMShadows.shadow1,
        borderRadius: BorderRadius.circular(2.0),
        color: SMColors.neutral0,
      ),
      child: BaseInput(
        focusNode: _focusNode,
        controller: widget.controller,
        validator: widget.validator,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
          suffixIcon: _buildSuffixIcon(_focusNode),
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

  Widget? _buildSuffixIcon(FocusNode focusNode) {
    if (widget.controller.text.isEmpty && focusNode.hasFocus) {
      return null;
    }
    if (widget.controller.text.isNotEmpty) {
      return IconButton(
        onPressed: () {
          focusNode.unfocus();
          widget.controller.clear();
        },
        icon: const SMIcon(
          icon: Icons.clear,
        ),
      );
    }
    return IconButton(
      icon: SMIcon(
        icon: widget.suffixIcon,
        active: true,
      ),
      onPressed: widget.onIconPressed,
    );
  }
}
