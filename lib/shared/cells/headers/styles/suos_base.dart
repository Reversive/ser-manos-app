import 'package:flutter/services.dart';

class SUOSBase extends SystemUiOverlayStyle {
  const SUOSBase({
    required super.statusBarColor,
  }) : super(
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        );
}
