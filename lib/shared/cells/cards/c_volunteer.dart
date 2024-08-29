import 'package:flutter/material.dart';
import 'package:ser_manos/features/volunteer/domain/voluntary.dart';
import 'package:ser_manos/shared/atoms/icon.dart';
import 'package:ser_manos/shared/molecules/components/c_vacancy.dart';
import 'package:ser_manos/shared/tokens/colors.dart';
import 'package:ser_manos/shared/tokens/decorations/bd_card.dart';
import 'package:ser_manos/shared/tokens/shadows.dart';
import 'package:ser_manos/shared/tokens/typographies/t_overline.dart';
import 'package:ser_manos/shared/tokens/typographies/t_subtitle01.dart';

final class CVolunteer extends Container {
  CVolunteer({
    super.key,
    super.margin,
    required Voluntary voluntary,
    required int vacancies,
  }) : super(
          decoration: BDCard(
            boxShadow: SMShadows.shadow2,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: Image(
                  image: NetworkImage(voluntary.imgURL),
                  fit: BoxFit.cover,
                  height: 138,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TOverline(
                              "ACCIÓN SOCIAL",
                              color: SMColors.neutral75,
                            ),
                            TSubtitle1(voluntary.name),
                            const SizedBox(
                              height: 4,
                            ),
                            CVacancy(vacancies: vacancies),
                          ],
                        ),
                      ),
                      const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SMIcon(
                            icon: Icons.favorite_border,
                            active: true,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          SMIcon(
                            icon: Icons.location_on,
                            active: true,
                          )
                        ],
                      )
                    ],
                  )),
            ],
          ),
        );
}
