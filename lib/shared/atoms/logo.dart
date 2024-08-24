import 'package:flutter/material.dart';

class RectangularLogo extends Image {
  const RectangularLogo({
    super.key,
  }) : super(
          image: const AssetImage('assets/logos/rectangle-logo.png'),
          height: 25,
        );
}

class SquaredLogo extends Image {
  const SquaredLogo({
    super.key,
  }) : super(
          image: const AssetImage('assets/logos/squared-logo.png'),
          height: 150,
          width: 150,
        );
}
