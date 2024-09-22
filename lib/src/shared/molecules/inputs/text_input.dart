import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ser_manos/src/shared/atoms/icon.dart';
import 'package:ser_manos/src/shared/molecules/inputs/base_input.dart';

class SMTextInput extends HookWidget {
  const SMTextInput({
    super.key,
    this.hintText,
    required this.labelText,
    required this.validator,
    this.enabled = true,
  });

  final String? hintText;
  final String labelText;
  final bool enabled;
  final Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();

    return BaseInput(
      controller: controller,
      hintText: hintText,
      labelText: labelText,
      enabled: enabled,
      validator: validator,
      suffixIcon: const SMIcon(icon: Icons.clear),
      permaShowSuffixIcon: false,
      onSuffixIconPressed: () => controller.clear(),
    );
  }
}
