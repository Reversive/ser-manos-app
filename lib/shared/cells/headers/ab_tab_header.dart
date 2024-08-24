import 'package:flutter/material.dart';
import 'package:ser_manos/shared/atoms/logo.dart';
import 'package:ser_manos/shared/cells/headers/styles/suos_secondary.dart';
import 'package:ser_manos/shared/tokens/colors.dart';
import 'package:ser_manos/shared/tokens/typographies/styles/ts_button.dart';

class ABTabHeader extends AppBar {
  ABTabHeader({
    super.key,
    required TabController tabController,
    required Function(int) onTapTab,
  }) : super(
          systemOverlayStyle: const SUOSSecondary(),
          title: Container(
            margin: const EdgeInsets.only(top: 8, left: 16, bottom: 8),
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
                onTap: onTapTab,
                unselectedLabelColor: SMColors.neutral25,
                labelColor: SMColors.neutral0,
                labelStyle: const TSButton(),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: SMColors.neutral0, width: 3)),
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
}
