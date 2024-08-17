import 'package:flutter/material.dart';

class CProfilePicture extends Container {
  CProfilePicture({
    super.key,
    super.height,
    super.width,
    required ImageProvider image,
  }) : super(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: image,
              fit: BoxFit.cover,
            ),
          ),
        );

  factory CProfilePicture.small({
    required ImageProvider image,
  }) =>
      CProfilePicture(
        height: 84,
        width: 84,
        image: image,
      );

  factory CProfilePicture.big({
    required ImageProvider image,
  }) =>
      CProfilePicture(
        height: 110,
        width: 110,
        image: image,
      );
}
