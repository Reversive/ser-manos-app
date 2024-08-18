import 'package:flutter/material.dart';
import 'package:ser_manos/layers/presentation/atoms/icon.dart';
import 'package:ser_manos/layers/presentation/molecules/inputs/tff_base.dart';
import 'package:ser_manos/layers/presentation/tokens/typographies/styles/ts_subtitle01.dart';

class TFFSearch extends TFFBase {
  TFFSearch({
    super.key,
    super.enabled,
    super.validator,
    required super.controller,
  }) : super(
          decoration: InputDecoration(
            suffixIcon: controller!.text.isNotEmpty
                ? IconButton(
                    onPressed: controller.clear,
                    icon: const SMIcon(
                      icon: Icons.clear,
                      active: true,
                    ),
                  )
                : const SMIcon(
                    icon: Icons.map_outlined,
                    active: true,
                  ),
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
            prefixIcon: const SMIcon(
              icon: Icons.search,
            ),
            hintText: 'Buscar',
            hintStyle: const TSSubtitle1(),
          ),
        );
}
