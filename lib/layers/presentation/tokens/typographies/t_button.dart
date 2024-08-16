import 'package:ser_manos/layers/presentation/tokens/text_styles/ts_button.dart';
import 'package:ser_manos/layers/presentation/tokens/typographies/t_base.dart';

final class TButton extends TBase {
  TButton(
    super.data, {
    super.key,
    super.color,
  }) : super(style: TSButton(color: color));
}