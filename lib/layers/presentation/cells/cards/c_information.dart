import 'package:flutter/material.dart';
import 'package:ser_manos/layers/domain/models/information.dart';
import 'package:ser_manos/layers/presentation/cells/cards/c_information_heading.dart';
import 'package:ser_manos/layers/presentation/tokens/colors.dart';
import 'package:ser_manos/layers/presentation/tokens/typographies/t_body01.dart';
import 'package:ser_manos/layers/presentation/tokens/typographies/t_overline.dart';

class CInfomation extends CInformationHeading {
  final Information information;
  CInfomation({
    super.key,
    required this.information,
  }) : super(
          title: information.title,
          child: Container(
            color: SMColors.neutral10,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TOverline(
                      information.label1,
                      color: SMColors.neutral75,
                    ),
                    TBody1(information.content1),
                  ],
                ),
                const SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TOverline(
                      information.label1,
                      color: SMColors.neutral75,
                    ),
                    TBody1(information.content1),
                  ],
                ),
              ],
            ),
          ),
        );
}
