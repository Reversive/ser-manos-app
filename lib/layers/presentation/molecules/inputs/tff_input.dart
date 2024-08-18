import 'package:flutter/material.dart';
import 'package:ser_manos/layers/presentation/atoms/icon.dart';
import 'package:ser_manos/layers/presentation/molecules/inputs/tff_base.dart';
import 'package:ser_manos/layers/presentation/tokens/decorations/id_base.dart';

class TFFInput extends TFFBase {
  TFFInput({
    super.key,
    super.enabled,
    required super.controller,
    required String hint,
    required String label,
  }) : super(
          decoration: IDBase(
            labelText: label,
            hintText: hint,
            suffixIcon: controller!.text.isNotEmpty
                ? IconButton(
                    onPressed: controller.clear,
                    icon: const SMIcon(
                      icon: Icons.clear,
                      active: true,
                    ))
                : null,
          ),
        );
}
