import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ser_manos/src/design-system/atoms/icon.dart';
import 'package:ser_manos/src/design-system/molecules/inputs/base_input.dart';
import 'package:ser_manos/src/design-system/molecules/inputs/validators/validator.dart';

class SMPasswordInput extends HookWidget {
  const SMPasswordInput({
    super.key,
    this.hintText,
    required this.labelText,
    this.enabled = true,
    required this.controller,
  });

  final String? hintText;
  final String labelText;
  final bool enabled;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final passwordVisible = useState(false);

    return BaseInput(
      controller: controller,
      hintText: hintText,
      labelText: labelText,
      enabled: enabled,
      validator: (value) => SMValidator.password(value, context),
      suffixIcon: passwordVisible.value
          ? const SMIcon(icon: Icons.visibility)
          : const SMIcon(icon: Icons.visibility_off),
      permaShowSuffixIcon: true,
      onSuffixIconPressed: () => passwordVisible.value = !passwordVisible.value,
      obscureText: !passwordVisible.value,
      shouldLoseFocusOnSuffixIconPressed: false,
    );
  }
}
