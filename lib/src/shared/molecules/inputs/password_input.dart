import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ser_manos/src/shared/atoms/icon.dart';
import 'package:ser_manos/src/shared/molecules/inputs/base_input.dart';

class SMPasswordInput extends HookWidget {
  const SMPasswordInput({
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
    final passwordVisible = useState(false);
    final TextEditingController controller = useTextEditingController();

    return BaseInput(
      controller: controller,
      hintText: hintText,
      labelText: labelText,
      enabled: enabled,
      validator: validator,
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
