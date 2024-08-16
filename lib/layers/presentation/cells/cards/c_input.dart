import 'package:flutter/material.dart';
import 'package:ser_manos/layers/presentation/atoms/icon.dart';
import 'package:ser_manos/layers/presentation/cells/cards/c_information_heading.dart';
import 'package:ser_manos/layers/presentation/tokens/colors.dart';
import 'package:ser_manos/layers/presentation/tokens/typographies/t_body01.dart';

class CInput extends CInformationHeading {
  final String headingTitle;
  CInput({
    super.key,
    required this.headingTitle,
  }) : super(
          title: headingTitle,
          child: Container(
            color: SMColors.neutral10,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SMIcon(icon: Icons.radio_button_unchecked),
                          const SizedBox(width: 8),
                          TBody1("Hombre"),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SMIcon(icon: Icons.radio_button_unchecked),
                          const SizedBox(width: 8),
                          TBody1("Mujer"),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SMIcon(icon: Icons.radio_button_unchecked),
                          const SizedBox(width: 8),
                          TBody1("No binario"),
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
        );
}
