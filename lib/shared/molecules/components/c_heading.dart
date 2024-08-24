import 'package:flutter/material.dart';
import 'package:ser_manos/shared/tokens/colors.dart';
import 'package:ser_manos/shared/tokens/typographies/t_subtitle01.dart';

class CHeading extends Container {
  final String title;
  CHeading({
    super.key,
    required Widget child,
    required this.title,
  }) : super(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                  color: SMColors.secondary25,
                ),
                child: TSubtitle1(title),
              ),
              child,
            ],
          ),
        );
}
