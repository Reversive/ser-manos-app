import 'package:flutter/material.dart';
import 'package:ser_manos/layers/domain/models/voluntary.dart';
import 'package:ser_manos/layers/presentation/atoms/icon.dart';
import 'package:ser_manos/layers/presentation/molecules/components/c_vacancy.dart';
import 'package:ser_manos/layers/presentation/tokens/colors.dart';
import 'package:ser_manos/layers/presentation/tokens/decorations/bd_card.dart';
import 'package:ser_manos/layers/presentation/tokens/shadows.dart';
import 'package:ser_manos/layers/presentation/tokens/typographies/t_overline.dart';
import 'package:ser_manos/layers/presentation/tokens/typographies/t_subtitle01.dart';

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
