import 'package:flutter/material.dart';
import 'package:ser_manos/features/volunteer/domain/voluntary.dart';
import 'package:ser_manos/shared/atoms/icon.dart';
import 'package:ser_manos/shared/molecules/components/c_vacancy.dart';
import 'package:ser_manos/shared/tokens/colors.dart';
import 'package:ser_manos/shared/tokens/decorations/bd_card.dart';
import 'package:ser_manos/shared/tokens/shadows.dart';
import 'package:ser_manos/shared/tokens/typographies/t_overline.dart';
import 'package:ser_manos/shared/tokens/typographies/t_subtitle01.dart';

final class CVoluntary extends Container {
  final Voluntary voluntary;
  final int vacancies;
  CVoluntary({super.key, required this.voluntary, required this.vacancies})
      : super(
          decoration: BDCard(boxShadow: SMShadows.shadow2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                image: NetworkImage(voluntary.imgURL),
                fit: BoxFit.cover,
                height: 138,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TOverline(
                        "ACCIÓN SOCIAL",
                        color: SMColors.neutral75,
                      ),
                      TSubtitle1(voluntary.name),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CVacancy(vacancies: vacancies),
                          const Row(
                            children: [
                              SMIcon(icon: Icons.favorite_border),
                              SizedBox(width: 16),
                              SMIcon(icon: Icons.location_on),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
}
