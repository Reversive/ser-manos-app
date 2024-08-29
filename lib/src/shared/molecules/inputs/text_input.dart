import 'package:flutter/material.dart';
import 'package:ser_manos/src/shared/atoms/icon.dart';
import 'package:ser_manos/src/shared/molecules/inputs/base_input.dart';

class SMTextInput extends StatefulWidget {
  const SMTextInput({
    super.key,
    this.hintText,
    required this.controller,
    required this.labelText,
    required this.validator,
    this.enabled = true,
  });

  final TextEditingController controller;
  final String? hintText;
  final String labelText;
  final bool enabled;
  final Function(String?) validator;

  @override
  State<SMTextInput> createState() => _SMTextInputState();
}

class _SMTextInputState extends State<SMTextInput> {
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
    return BaseInput(
      controller: widget.controller,
      hintText: widget.hintText,
      labelText: widget.labelText,
      enabled: widget.enabled,
      validator: widget.validator,
      suffixIcon: const SMIcon(icon: Icons.clear),
      permaShowSuffixIcon: false,
      onSuffixIconPressed: widget.controller.clear,
    );
  }
}
