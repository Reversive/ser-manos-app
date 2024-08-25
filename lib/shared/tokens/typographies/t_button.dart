import 'package:ser_manos/shared/tokens/typographies/styles/ts_button.dart';
import 'package:ser_manos/shared/tokens/typographies/t_base.dart';

final class TButton extends TBase {
  TButton(
    super.data, {
    super.key,
    super.color,
    super.textAlign,
  }) : super(style: TSButton(color: color));
}