import 'package:ser_manos/layers/presentation/tokens/typographies/styles/ts_overline.dart';
import 'package:ser_manos/layers/presentation/tokens/typographies/t_base.dart';

final class TOverline extends TBase {
  TOverline(
    super.data, {
    super.key,
    super.color,
  }) : super(style: TSOverline(color: color));
}