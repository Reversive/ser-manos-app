import 'package:flutter/material.dart';

class SMFill extends StatelessWidget {
  final Widget child;

  const SMFill({
    super.key,
    required this.child,
    this.height,
    this.width,
  });

  factory SMFill.horizontal({Key? key, required Widget child}) {
    return SMFill(
      key: key,
      width: double.infinity,
      child: child,
    );
  }

  factory SMFill.vertical({Key? key, required Widget child}) {
    return SMFill(
      key: key,
      height: double.infinity,
      child: child,
    );
  }

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: child,
    );
  }
}
