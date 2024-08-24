import 'package:flutter/material.dart';
import 'package:ser_manos/features/auth/domain/information.dart';
import 'package:ser_manos/shared/molecules/components/c_heading.dart';
import 'package:ser_manos/shared/molecules/components/c_labeled_content.dart';
import 'package:ser_manos/shared/tokens/colors.dart';

class CInfomation extends CHeading {
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
                CLabeledContent(
                  label: information.label1,
                  content: information.content1,
                ),
                const SizedBox(height: 8),
                CLabeledContent(
                  label: information.label2,
                  content: information.content2,
                ),
              ],
            ),
          ),
        );
}
