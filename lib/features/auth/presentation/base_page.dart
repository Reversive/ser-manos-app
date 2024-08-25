import 'package:flutter/material.dart';
import 'package:ser_manos/shared/cells/headers/ab_modal_header.dart';
import 'package:ser_manos/shared/tokens/grid.dart';

class BasePage extends Scaffold {
  BasePage({
    super.key,
    required List<Widget> content,
  }) : super(
          resizeToAvoidBottomInset: true,
          appBar: ABModalHeader(
            implyLeading: false,
          ),
          body: Grid(
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
