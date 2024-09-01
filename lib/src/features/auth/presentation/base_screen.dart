import 'package:flutter/material.dart';
import 'package:ser_manos/src/core/theme/colors.dart';
import 'package:ser_manos/src/shared/cells/headers/header.dart';
import 'package:ser_manos/src/shared/tokens/grid.dart';

class BaseScreen extends Scaffold {
  BaseScreen({
    super.key,
    required List<Widget> content,
  }) : super(
          resizeToAvoidBottomInset: true,
          backgroundColor: SMColors.neutral0,
          appBar: SMHeader.modal(
            implyLeading: false,
          ),
          body: SMGrid(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        minWidth: constraints.maxWidth,
                        minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: content,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
}
