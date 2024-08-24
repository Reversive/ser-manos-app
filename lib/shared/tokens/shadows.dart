import 'package:flutter/material.dart';
import 'package:ser_manos/shared/tokens/colors.dart';

abstract final class SMShadows {
  static final BoxShadow shadow0_1_3_1_15 = BoxShadow(
    offset: const Offset(0, 1),
    spreadRadius: 1,
    blurRadius: 3,
    color: SMColors.neutral100.withOpacity(0.15),
  );

  static final BoxShadow shadow0_1_2_0_30 = BoxShadow(
    offset: const Offset(0, 1),
    spreadRadius: 0,
    blurRadius: 2,
    color: SMColors.neutral100.withOpacity(0.30),
  );

  static final List<BoxShadow> shadow1 = [
    shadow0_1_3_1_15,
    shadow0_1_2_0_30,
  ];

  static final BoxShadow shadow0_2_2_6_15 = BoxShadow(
    offset: const Offset(0, 2),
    spreadRadius: 2,
    blurRadius: 6,
    color: SMColors.neutral100.withOpacity(0.15),
  );

  static final BoxShadow shadow0_1_0_2_30 = BoxShadow(
    offset: const Offset(0, 1),
    spreadRadius: 0,
    blurRadius: 2,
    color: SMColors.neutral100.withOpacity(0.30),
  );

  static final List<BoxShadow> shadow2 = [
    shadow0_2_2_6_15,
    shadow0_1_0_2_30,
  ];

  static final BoxShadow shadow0_4_4_0_30 = BoxShadow(
    color: SMColors.neutral100.withOpacity(0.30),
    blurRadius: 4,
    offset: const Offset(0, 4),
  );

  static final BoxShadow shadow0_8_12_6_15 = BoxShadow(
    color: SMColors.neutral100.withOpacity(0.15),
    blurRadius: 12,
    spreadRadius: 6,
    offset: const Offset(0, 8),
  );

  static final List<BoxShadow> shadow3 = [
    shadow0_4_4_0_30,
    shadow0_8_12_6_15,
  ];
}
