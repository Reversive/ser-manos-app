import 'package:flutter/material.dart';
import 'package:ser_manos/shared/atoms/logo.dart';
import 'package:ser_manos/shared/cells/headers/ab_modal_header.dart';
import 'package:ser_manos/shared/molecules/buttons/b_cta_filled.dart';
import 'package:ser_manos/shared/molecules/buttons/b_cta_text.dart';
import 'package:ser_manos/shared/tokens/grid.dart';
import 'package:ser_manos/shared/tokens/typographies/t_subtitle01.dart';

class EntryPage extends Scaffold {
  EntryPage({
    super.key,
  }) : super(
          appBar: ABModalHeader(
            implyLeading: false,
          ),
          body: Grid(
            child: Center(
              child: Column(
                children: [
                  const Spacer(),
                  Column(
                    children: [
                      const SquaredLogo(),
                      const SizedBox(height: 32),
                      TSubtitle1(
                        "“El esfuerzo desinteresado para llevar alegría a los demás será el comienzo de una vida más feliz para nosotros”",
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: BCtaFilled(
                          "Iniciar Sesión",
                          onPressed: () => print("TODO"),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: BCtaText(
                          "Registrarse",
                          onPressed: () => print("TODO"),
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
}
