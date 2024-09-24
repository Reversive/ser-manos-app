import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ser_manos/src/features/news/models/news.dart';
import 'package:ser_manos/src/features/profile/models/gender.dart';
import 'package:ser_manos/src/features/volunteer/models/volunteering.dart';
import 'package:ser_manos/src/shared/atoms/icon.dart';
import 'package:ser_manos/src/shared/molecules/buttons/button.dart';
import 'package:ser_manos/src/shared/molecules/components/component.dart';
import 'package:ser_manos/src/core/theme/colors.dart';
import 'package:ser_manos/src/shared/tokens/google_map.dart';
import 'package:ser_manos/src/shared/tokens/gap.dart';
import 'package:ser_manos/src/shared/tokens/shadows.dart';
import 'package:ser_manos/src/shared/tokens/typography.dart';
import 'package:ser_manos/src/features/profile/models/location.dart';
import 'package:ser_manos/src/features/auth/models/information.dart';

class SMCard extends StatelessWidget {
  const SMCard({
    super.key,
    this.padding,
    this.decoration,
    this.margin,
    this.onTap,
    required this.child,
  });

  factory SMCard.currentVolunteer({
    Key? key,
    required Volunteering volunteering,
  }) {
    return SMCard(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: SMColors.primary5,
        boxShadow: SMShadows.shadow2,
        border: Border.all(
          color: SMColors.primary100,
          width: 2.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SMTypography.overline(
                    "ACCIÓN SOCIAL",
                    color: SMColors.neutral75,
                  ),
                  SMTypography.subtitle01(volunteering.name),
                ],
              ),
            ),
            const SMIcon(icon: Icons.location_on),
          ],
        ),
      ),
    );
  }

  factory SMCard.information({
    Key? key,
    required Information information,
  }) {
    return SMCard(
      child: SMComponent.heading(
        title: information.title,
        child: Container(
          color: SMColors.neutral10,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SMComponent.labeledContent(
                label: information.label1,
                content: information.content1,
              ),
              const SMGap.vertical(height: 8),
              SMComponent.labeledContent(
                label: information.label2,
                content: information.content2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  factory SMCard.input({
    Key? key,
    required String title,
    required Gender groupValue,
    required void Function(Gender?) onChanged,
  }) {
    return SMCard(
      child: SMComponent.heading(
        title: title,
        child: Container(
          color: SMColors.neutral10,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            children: [
              RadioListTile<Gender>(
                title: SMTypography.body01(
                  "Hombre",
                  color: SMColors.neutral100,
                ),
                dense: true,
                groupValue: groupValue,
                onChanged: onChanged,
                value: Gender.male,
                contentPadding: EdgeInsets.zero,
                visualDensity:
                    const VisualDensity(horizontal: -4, vertical: -4),
                activeColor: SMColors.primary100,
                fillColor: const WidgetStatePropertyAll(SMColors.primary100),
              ),
              RadioListTile<Gender>(
                title: SMTypography.body01(
                  "Mujer",
                  color: SMColors.neutral100,
                ),
                groupValue: groupValue,
                onChanged: onChanged,
                dense: true,
                value: Gender.female,
                contentPadding: EdgeInsets.zero,
                visualDensity:
                    const VisualDensity(horizontal: -4, vertical: -4),
                activeColor: SMColors.primary100,
                fillColor: const WidgetStatePropertyAll(SMColors.primary100),
              ),
              RadioListTile<Gender>(
                title: SMTypography.body01(
                  "No binario",
                  color: SMColors.neutral100,
                ),
                groupValue: groupValue,
                dense: true,
                onChanged: onChanged,
                value: Gender.nonBinary,
                contentPadding: EdgeInsets.zero,
                visualDensity:
                    const VisualDensity(horizontal: -4, vertical: -4),
                activeColor: SMColors.primary100,
                fillColor: const WidgetStatePropertyAll(SMColors.primary100),
              ),
            ],
          ),
        ),
      ),
    );
  }

  factory SMCard.location({
    Key? key,
    required Location location,
    bool hasEmbeddedMap = false,
  }) {
    return SMCard(
      child: SMComponent.heading(
        title: "Información de perfil",
        child: Container(
          decoration: const BoxDecoration(
            color: SMColors.neutral10,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(4),
              bottomRight: Radius.circular(4),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              hasEmbeddedMap
                  ? Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: SizedBox(
                        height: 155,
                        child: SMGoogleMap(
                          location: LatLng(
                            location.lat,
                            location.lng,
                          ),
                          cameraPosition: CameraPosition(
                            target: LatLng(
                              location.lat,
                              location.lng,
                            ),
                            zoom: 15,
                          ),
                        ),
                      ),
                    )
                  : Container(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SMComponent.labeledContent(
                        label: "dirección",
                        content:
                            '${location.street} ${location.number}, ${location.city}, ${location.state}.',
                      ),
                    ),
                    hasEmbeddedMap
                        ? Container()
                        : const SMIcon(
                            icon: Icons.location_on,
                            active: true,
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  factory SMCard.news({
    Key? key,
    required News news,
    required VoidCallback onPressed,
  }) {
    return SMCard(
      decoration: BoxDecoration(
        boxShadow: SMShadows.shadow2,
        color: SMColors.neutral0,
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image(
              image: NetworkImage(news.imageUrl),
              fit: BoxFit.cover,
              width: 118,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SMTypography.overline(
                      news.source.toUpperCase(),
                      color: SMColors.neutral75,
                    ),
                    const SMGap.vertical(height: 4),
                    SMTypography.subtitle01(news.title),
                    const SMGap.vertical(height: 4),
                    SMTypography.body02(
                      news.summary,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      color: SMColors.neutral75,
                    ),
                    const SMGap.vertical(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
                          child: SMButton.text(
                            "Leer Más",
                            onPressed: onPressed,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  factory SMCard.noVolunteerings({
    Key? key,
  }) {
    return SMCard(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: SMColors.neutral0,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SMTypography.subtitle01(
            "No hay voluntariados vigentes para tu búsqueda.",
            align: TextAlign.center,
          ),
        ),
      ),
    );
  }

  factory SMCard.profile({
    Key? key,
    ImageProvider? image,
  }) {
    return SMCard(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      decoration: BoxDecoration(
        color: SMColors.secondary25,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SMTypography.subtitle01("Foto de perfil"),
              if (image != null) const SMGap.vertical(height: 8),
              if (image != null)
                SMButton.shortSmall(
                  "Cambiar foto",
                  onPressed: () => {},
                ),
            ],
          ),
          image == null
              ? SMButton.shortSmall(
                  "Subir foto",
                  onPressed: () => {},
                )
              : SMComponent.profilePictureSmall(
                  image: image,
                ),
        ],
      ),
    );
  }

  factory SMCard.volunteer({
    Key? key,
    required Volunteering volunteer,
    EdgeInsetsGeometry? margin,
    void Function()? onTap,
  }) {
    return SMCard(
      key: key,
      onTap: onTap,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.0),
        boxShadow: SMShadows.shadow2,
        color: SMColors.neutral0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: Image(
              image: NetworkImage(volunteer.imageUrl),
              fit: BoxFit.cover,
              height: 138,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SMTypography.overline(
                        "ACCIÓN SOCIAL",
                        color: SMColors.neutral75,
                      ),
                      SMTypography.subtitle01(volunteer.name),
                      const SMGap.vertical(
                        height: 4,
                      ),
                      SMComponent.vacancy(
                        vacancies: volunteer.vacancies,
                      ),
                    ],
                  ),
                ),
                const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SMIcon(
                      icon: Icons.favorite_border,
                      active: true,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    SMIcon(
                      icon: Icons.location_on,
                      active: true,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  final EdgeInsetsGeometry? padding;
  final Decoration? decoration;
  final EdgeInsetsGeometry? margin;
  final Widget child;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding,
        margin: margin,
        decoration: decoration,
        child: child,
      ),
    );
  }
}
