import 'package:flutter/material.dart';
import 'package:ser_manos/shared/tokens/decorations/bd_card.dart';
import 'package:ser_manos/shared/tokens/typographies/t_subtitle01.dart';

class CNoVolunteerings extends Container {
  CNoVolunteerings({super.key})
      : super(
            decoration: BDCard(
              radius: 4.0,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: TSubtitle1(
                  "No hay voluntariados vigentes para tu búsqueda.",
                  textAlign: TextAlign.center,
                ),
              ),
            ));
}
