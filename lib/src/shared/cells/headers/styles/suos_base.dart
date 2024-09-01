import 'package:flutter/services.dart';

class SUOSBase extends SystemUiOverlayStyle {
  const SUOSBase({
    required super.statusBarColor,
  }) : super(
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        );
}
