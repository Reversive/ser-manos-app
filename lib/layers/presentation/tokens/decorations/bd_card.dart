import 'package:flutter/material.dart';
import 'package:ser_manos/layers/presentation/tokens/decorations/bd_base.dart';
import 'package:ser_manos/layers/presentation/tokens/shadows.dart';

final class BDCard extends BDBase {
  BDCard({
    super.color,
    double radius = 2.0,
    super.border,
  }) : super(
          boxShadow: SMShadows.shadow2,
          borderRadius: BorderRadius.circular(radius),
        );
}
