import 'package:flutter/material.dart';
import 'package:ser_manos/shared/tokens/decorations/bd_base.dart';

final class BDCard extends BDBase {
  BDCard({
    super.color,
    double radius = 2.0,
    super.boxShadow,
    super.border,
  }) : super(
          borderRadius: BorderRadius.circular(radius),
        );
}
