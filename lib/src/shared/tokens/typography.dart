import 'package:flutter/material.dart';
import 'package:ser_manos/src/core/theme/colors.dart';

class SMTypography extends StatelessWidget {
  const SMTypography(this.data, {super.key, this.style, this.align});

  factory SMTypography.body01(
    String data, {
    Key? key,
    TextAlign? align,
    Color? color,
  }) {
    return SMTypography(
      key: key,
      data,
      style: body01Style(color: color),
    );
  }

  factory SMTypography.body02(
    String data, {
    Key? key,
    TextAlign? align,
    Color? color,
  }) {
    return SMTypography(
      key: key,
      data,
      style: body02Style(color: color),
    );
  }

  factory SMTypography.button(
    String data, {
    Key? key,
    TextAlign? align,
    Color? color,
  }) {
    return SMTypography(
      key: key,
      data,
      style: buttonStyle(color: color),
    );
  }

  factory SMTypography.caption(
    String data, {
    Key? key,
    TextAlign? align,
    Color? color,
  }) {
    return SMTypography(
      key: key,
      data,
      style: captionStyle(color: color),
    );
  }

  factory SMTypography.headline01(
    String data, {
    Key? key,
    TextAlign? align,
    Color? color,
  }) {
    return SMTypography(
      key: key,
      data,
      style: headline01Style(color: color),
    );
  }

  factory SMTypography.headline02(
    String data, {
    Key? key,
    TextAlign? align,
    Color? color,
  }) {
    return SMTypography(
      key: key,
      data,
      style: headline02Style(color: color),
    );
  }

  factory SMTypography.overline(
    String data, {
    Key? key,
    TextAlign? align,
    Color? color,
  }) {
    return SMTypography(
      key: key,
      data,
      style: overlineStyle(color: color),
    );
  }

  factory SMTypography.subtitle01(
    String data, {
    Key? key,
    TextAlign? align,
    Color? color,
  }) {
    return SMTypography(
      key: key,
      data,
      style: subtitle01Style(color: color),
    );
  }

  final String data;
  final TextStyle? style;
  final TextAlign? align;

  static TextStyle body01Style({Color? color}) => TextStyle(
        fontSize: 14,
        color: color ?? SMColors.neutral100,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      );

  static TextStyle body02Style({Color? color}) => TextStyle(
        fontSize: 16,
        color: color ?? SMColors.neutral100,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
      );

  static TextStyle buttonStyle({Color? color}) => TextStyle(
        fontSize: 14,
        color: color ?? SMColors.neutral100,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      );

  static TextStyle captionStyle({Color? color}) => TextStyle(
        fontSize: 12,
        color: color ?? SMColors.neutral100,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
      );

  static TextStyle headline01Style({Color? color}) => TextStyle(
        fontSize: 24,
        color: color ?? SMColors.neutral100,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.18,
      );

  static TextStyle headline02Style({Color? color}) => TextStyle(
        fontSize: 20,
        color: color ?? SMColors.neutral100,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      );

  static TextStyle overlineStyle({Color? color}) => TextStyle(
        fontSize: 10,
        color: color ?? SMColors.neutral100,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.5,
      );

  static TextStyle subtitle01Style({Color? color}) => TextStyle(
        fontSize: 16,
        color: color ?? SMColors.neutral100,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
      );

  @override
  Widget build(BuildContext context) {
    return Text(data, style: style, textAlign: align);
  }
}
