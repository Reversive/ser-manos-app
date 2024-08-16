import 'package:ser_manos/layers/presentation/tokens/colors.dart';
import 'package:ser_manos/layers/presentation/tokens/decorations/bd_base.dart';
import 'package:ser_manos/layers/presentation/tokens/shadows.dart';

final class BDButton extends BDBase {
  BDButton({
    super.border,
  }) : super(
          boxShadow: SMShadows.shadow3,
          color: SMColors.transparent,
        );
}
