import 'package:ser_manos/layers/presentation/tokens/text_styles/ts_caption.dart';
import 'package:ser_manos/layers/presentation/tokens/typographies/t_base.dart';

final class TCaption extends TBase {
  TCaption(
    super.data, {
    super.key,
    super.color,
  }) : super(style: TSCaption(color: color));
}
