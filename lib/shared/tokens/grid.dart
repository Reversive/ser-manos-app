import 'package:flutter/material.dart';

class Grid extends Padding {
  const Grid({
    super.key,
    required Widget child,
  }) : super(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: child,
        );
}
