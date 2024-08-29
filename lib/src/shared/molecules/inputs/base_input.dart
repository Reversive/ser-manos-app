import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ser_manos/src/shared/atoms/icon.dart';
import 'package:ser_manos/src/core/theme/colors.dart';
import 'package:ser_manos/src/shared/molecules/inputs/decorations/base_input_decoration.dart';
import 'package:ser_manos/src/shared/tokens/typography.dart';

class BaseInput extends StatefulWidget {
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
  });

  @override
  State<BaseInput> createState() => _BaseInputState();
}

class _BaseInputState extends State<BaseInput> {
  FocusNode _focusNode = FocusNode();
  bool _validationFailed = false;

  void _setState() {
    setState(() {});
  }

  @override
  void initState() {
    _focusNode = widget.focusNode ?? FocusNode();
    super.initState();
    _focusNode.addListener(_setState);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_setState);
    //widget.controller.dispose(); // Uncomment this line to dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: SMTypography.subtitle01Style(),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: widget.decoration ??
          BaseInputDecoration(
            hintText: widget.hintText,
            labelText: widget.labelText,
            helperText: _focusNode.hasFocus ? widget.helperText : null,
            suffixIcon: _validationFailed
                ? SMIcon.error()
                : _buildSuffixIcon(_focusNode),
            floatingLabelBehavior: widget.hintText != null
                ? FloatingLabelBehavior.always
                : FloatingLabelBehavior.auto,
            labelStyle: _validationFailed
                ? SMTypography.captionStyle(
                    color: SMColors.error100,
                  )
                : _focusNode.hasFocus
                    ? SMTypography.captionStyle(
                        color: SMColors.secondary200,
                      )
                    : SMTypography.captionStyle(
                        color: SMColors.neutral75,
                      ),
          ),
      controller: widget.controller,
      enabled: widget.enabled,
      focusNode: _focusNode,
      onChanged: _onChanged,
      validator: (value) => widget.validator(value),
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      obscureText: widget.obscureText,
    );
  }

  void _onChanged(value) {
    setState(() {
      _validationFailed = widget.validator(value) != null;
    });
  }

  IconButton? _buildSuffixIcon(FocusNode focusNode) {
    if (widget.suffixIcon == null) {
      return null;
    }

    if (widget.controller.text.isNotEmpty &&
        !focusNode.hasFocus &&
        !widget.permaShowSuffixIcon) {
      return null;
    }

    return widget.permaShowSuffixIcon
        ? IconButton(
            onPressed: () async {
              if (widget.onSuffixIconPressed != null) {
                await widget.onSuffixIconPressed!();
              }
              if (widget.shouldLoseFocusOnSuffixIconPressed) {
                focusNode.unfocus();
              }
              _onChanged(widget.controller.text);
            },
            icon: widget.suffixIcon!,
          )
        : widget.controller.text.isNotEmpty
            ? IconButton(
                onPressed: () async {
                  if (widget.onSuffixIconPressed != null) {
                    await widget.onSuffixIconPressed!();
                  }
                  if (widget.shouldLoseFocusOnSuffixIconPressed) {
                    focusNode.unfocus();
                  }
                  _onChanged(widget.controller.text);
                },
                icon: widget.suffixIcon!,
              )
            : null;
  }
}
