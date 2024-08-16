import 'package:flutter/material.dart';
import 'package:ser_manos/layers/presentation/atoms/icon.dart';
import 'package:ser_manos/layers/presentation/molecules/buttons/styles/bs_floating.dart';
import 'package:ser_manos/layers/presentation/tokens/decorations/bd_button.dart';

class BFloating extends Container {
  BFloating(
    IconData icon, {
    super.key,
    required VoidCallback onPressed,
    bool disabled = false,
  }) : super(
          width: 48,
          height: 48,
          decoration: BDButton(),
          child: IconButton(
            style: BSFloating(disabled: disabled),
            icon: SMIcon(
              icon: icon,
              disabled: disabled,
              active: true,
            ),
            onPressed: onPressed,
          ),
        );
}
