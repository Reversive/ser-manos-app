import 'package:flutter/material.dart';
import 'package:ser_manos/features/volunteer/domain/voluntary.dart';
import 'package:ser_manos/shared/atoms/icon.dart';
import 'package:ser_manos/shared/tokens/colors.dart';
import 'package:ser_manos/shared/tokens/decorations/bd_card.dart';
import 'package:ser_manos/shared/tokens/shadows.dart';
import 'package:ser_manos/shared/tokens/typographies/t_overline.dart';
import 'package:ser_manos/shared/tokens/typographies/t_subtitle01.dart';

class CCurrentVolunteer extends Container {
  final Voluntary voluntary;
  CCurrentVolunteer({super.key, required this.voluntary})
      : super(
          decoration: BDCard(
            radius: 6.0,
            color: SMColors.primary5,
            boxShadow: SMShadows.shadow2,
            border: Border.all(
              color: SMColors.primary100,
              width: 2.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TOverline(
                        "ACCIÓN SOCIAL",
                        color: SMColors.neutral75,
                      ),
                      TSubtitle1(voluntary.name),
                    ],
                  ),
                ),
                const SMIcon(icon: Icons.location_on),
              ],
            ),
          ),
        );
}
