import 'package:flutter/material.dart';

class SMGap extends StatelessWidget {
  final double? width;
  final double? height;

  const SMGap.vertical({
    super.key,
    required this.height,
  }) : width = null;

  const SMGap.horizontal({
    super.key,
    required this.width,
  }) : height = null;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}
