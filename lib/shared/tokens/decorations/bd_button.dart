import 'package:ser_manos/shared/tokens/colors.dart';
import 'package:ser_manos/shared/tokens/decorations/bd_base.dart';
import 'package:ser_manos/shared/tokens/shadows.dart';

final class BDButton extends BDBase {
  BDButton({
    super.border,
  }) : super(
          boxShadow: SMShadows.shadow3,
          color: SMColors.transparent,
        );
}
