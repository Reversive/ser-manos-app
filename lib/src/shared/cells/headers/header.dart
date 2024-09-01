import 'package:flutter/material.dart';
import 'package:ser_manos/src/shared/atoms/logo.dart';
import 'package:ser_manos/src/shared/cells/headers/styles/suos_light.dart';
import 'package:ser_manos/src/shared/cells/headers/styles/suos_secondary.dart';
import 'package:ser_manos/src/core/theme/colors.dart';
import 'package:ser_manos/src/shared/tokens/typography.dart';

class SMHeader extends AppBar {
  SMHeader.tab({
    super.key,
    required TabController tabController,
    required Function(int) onTap,
  }) : super(
          systemOverlayStyle: const SUOSSecondary(),
          title: Container(
            margin: const EdgeInsets.only(
              top: 8,
              left: 16,
              bottom: 8,
            ),
            height: 41,
            child: const RectangularLogo(),
          ),
          backgroundColor: SMColors.secondary90,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(52),
            child: Container(
              color: SMColors.secondary100,
              child: TabBar(
                controller: tabController,
                onTap: onTap,
                unselectedLabelColor: SMColors.neutral25,
                labelColor: SMColors.neutral0,
                labelStyle: SMTypography.buttonStyle(),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: SMColors.neutral0,
                      width: 3,
                    ),
                  ),
                  color: SMColors.secondary200,
                ),
                tabs: const [
                  Tab(
                    text: "Postularse",
                  ),
                  Tab(
                    text: "Mi perfil",
                  ),
                  Tab(
                    text: "Novedades",
                  ),
                ],
              ),
            ),
          ),
        );

  SMHeader.section({
    super.key,
    bool hasBackButton = true,
    required String subtitle,
  }) : super(
          systemOverlayStyle: const SUOSSecondary(),
          backgroundColor: SMColors.secondary90,
          leading: hasBackButton
              ? const BackButton(
                  color: SMColors.neutral0,
                )
              : null,
          centerTitle: true,
          title: SMTypography.subtitle01(
            subtitle,
            color: SMColors.neutral0,
          ),
        );

  SMHeader.modal({super.key, bool implyLeading = true})
      : super(
          systemOverlayStyle: const SUOSLight(),
          backgroundColor: SMColors.neutral0,
          leading: implyLeading
              ? const CloseButton(
                  color: SMColors.neutral75,
                )
              : null,
        );
}
