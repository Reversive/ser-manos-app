import 'package:flutter/services.dart';

class SUOSBase extends SystemUiOverlayStyle {
  const SUOSBase({
    required super.statusBarColor,
    Brightness? ib,
    Brightness? bb,
  }) : super(
          statusBarIconBrightness: ib ?? Brightness.dark,
          statusBarBrightness: bb ?? Brightness.dark,
        );
}
