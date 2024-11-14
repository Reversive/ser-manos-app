import 'package:flutter/material.dart';
import 'package:ser_manos/src/design-system/atoms/icon.dart';
import 'package:ser_manos/src/core/theme/colors.dart';
import 'package:ser_manos/src/design-system/tokens/gap.dart';
import 'package:ser_manos/src/design-system/tokens/typography.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SMComponent extends StatelessWidget {
  const SMComponent({
    super.key,
    this.decoration,
    this.padding,
    this.width,
    this.height,
    this.child,
  });

  factory SMComponent.vacancy({
    Key? key,
    required int vacancies,
    required BuildContext context,
  }) {
    return SMComponent(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: SMColors.secondary25,
      ),
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SMTypography.body02(AppLocalizations.of(context)!.vacancies),
          const SMGap.horizontal(
            width: 8.0,
          ),
          SMIcon.secondary(
            icon: Icons.person,
          ),
          SMTypography.subtitle01(vacancies.toString()),
        ],
      ),
    );
  }

  factory SMComponent.profilePictureSmall({
    Key? key,
    required ImageProvider image,
  }) {
    return SMComponent(
      height: 84,
      width: 84,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  factory SMComponent.profilePictureBig({
    Key? key,
    required ImageProvider image,
  }) {
    return SMComponent(
      height: 110,
      width: 110,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  factory SMComponent.labeledContent({
    Key? key,
    required String label,
    required String content,
  }) {
    return SMComponent(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SMTypography.overline(
            label.toUpperCase(),
            color: SMColors.neutral75,
          ),
          SMTypography.body01(
            content,
          ),
        ],
      ),
    );
  }

  factory SMComponent.bulletList({
    Key? key,
    required List<String> items,
  }) {
    return SMComponent(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: items.length,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) =>
            SMTypography.body01("• ${items[index]}"),
      ),
    );
  }

  factory SMComponent.heading({
    Key? key,
    required String title,
    required Widget child,
  }) {
    return SMComponent(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4.0),
                topRight: Radius.circular(4.0),
              ),
              color: SMColors.secondary25,
            ),
            child: SMTypography.subtitle01(title),
          ),
          child,
        ],
      ),
    );
  }

  final BoxDecoration? decoration;
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      padding: padding,
      width: width,
      height: height,
      child: child,
    );
  }
}
