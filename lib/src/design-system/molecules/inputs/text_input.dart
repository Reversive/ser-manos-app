import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ser_manos/src/design-system/atoms/icon.dart';
import 'package:ser_manos/src/design-system/molecules/inputs/base_input.dart';

class SMTextInput extends HookWidget {
  const SMTextInput({
    super.key,
    this.hintText,
    required this.labelText,
    required this.validator,
    this.enabled = true,
    required this.controller,
    this.keyboardType = TextInputType.text,
  });

  final String? hintText;
  final String labelText;
  final bool enabled;
  final Function(String?) validator;
  final TextEditingController controller;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return BaseInput(
      controller: controller,
      hintText: hintText,
      labelText: labelText,
      enabled: enabled,
      validator: validator,
      suffixIcon: const SMIcon(icon: Icons.clear),
      permaShowSuffixIcon: false,
      onSuffixIconPressed: () => controller.clear(),
      keyboardType: keyboardType,
    );
  }
}
