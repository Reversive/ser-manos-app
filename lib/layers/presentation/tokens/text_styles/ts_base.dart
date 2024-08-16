import 'package:flutter/material.dart';

abstract class TSBase extends TextStyle {
  const TSBase({
    required double fontSize,
    super.color,
    super.fontWeight,
    super.letterSpacing,
    required double height,
  }) : super(
          fontFamily: "Roboto",
          fontSize: fontSize,
          // height: fontSize / height,
        );
}