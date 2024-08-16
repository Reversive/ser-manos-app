import 'package:flutter/material.dart';
import 'package:ser_manos/layers/domain/models/information.dart';
import 'package:ser_manos/layers/presentation/tokens/colors.dart';
import 'package:ser_manos/layers/presentation/tokens/typographies/t_body01.dart';
import 'package:ser_manos/layers/presentation/tokens/typographies/t_overline.dart';
import 'package:ser_manos/layers/presentation/tokens/typographies/t_subtitle01.dart';

class CInfomation extends Container {
  final Information information;
  CInfomation({
    super.key,
    required this.information,
  }) : super(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: SMColors.neutral10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                color: SMColors.secondary25,
                child: TSubtitle1(information.title),
              ),
              Container(
                color: SMColors.neutral10,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
              )
            ],
          ),
        );
}
