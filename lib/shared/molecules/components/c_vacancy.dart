import 'package:flutter/material.dart';
import 'package:ser_manos/shared/atoms/icon.dart';
import 'package:ser_manos/shared/tokens/colors.dart';
import 'package:ser_manos/shared/tokens/typographies/t_body02.dart';
import 'package:ser_manos/shared/tokens/typographies/t_subtitle01.dart';

final class CVacancy extends Container {
  final int vacancies;
  CVacancy({
    super.key,
    required this.vacancies,
  }) : super(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: SMColors.secondary25,
          ),
          padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TBody2("Vacantes:"),
              const SizedBox(
                width: 8.0,
              ),
              SMIcon.secondary(
                icon: Icons.person,
              ),
              TSubtitle1(vacancies.toString()),
            ],
          ),
        );
}
