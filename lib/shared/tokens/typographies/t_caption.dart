import 'package:ser_manos/shared/tokens/typographies/styles/ts_caption.dart';
import 'package:ser_manos/shared/tokens/typographies/t_base.dart';

final class TCaption extends TBase {
  TCaption(
    super.data, {
    super.key,
    super.color,
    super.textAlign,
  }) : super(style: TSCaption(color: color));
}
