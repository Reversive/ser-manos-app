import 'package:flutter/material.dart';
import 'package:ser_manos/src/shared/atoms/icon.dart';
import 'package:ser_manos/src/shared/molecules/inputs/base_input.dart';

class SMPasswordInput extends StatefulWidget {
  const SMPasswordInput({
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
  State<SMPasswordInput> createState() => _SMPasswordInputState();
}

class _SMPasswordInputState extends State<SMPasswordInput> {
  bool _passwordVisible = false;
  void _setState() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_setState);
    _passwordVisible = false;
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
      suffixIcon: _passwordVisible
          ? const SMIcon(icon: Icons.visibility)
          : const SMIcon(icon: Icons.visibility_off),
      permaShowSuffixIcon: true,
      onSuffixIconPressed: () {
        setState(() {
          _passwordVisible = !_passwordVisible;
        });
      },
      obscureText: !_passwordVisible,
      shouldLoseFocusOnSuffixIconPressed: false,
    );
  }
}
