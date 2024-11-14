import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ser_manos/src/design-system/tokens/fill.dart';
import 'package:ser_manos/src/features/news/models/news.dart';
import 'package:ser_manos/src/features/profile/models/gender.dart';
import 'package:ser_manos/src/features/volunteer/models/volunteering.dart';
import 'package:ser_manos/src/design-system/atoms/icon.dart';
import 'package:ser_manos/src/design-system/molecules/buttons/button.dart';
import 'package:ser_manos/src/design-system/molecules/components/component.dart';
import 'package:ser_manos/src/core/theme/colors.dart';
import 'package:ser_manos/src/design-system/tokens/google_map.dart';
import 'package:ser_manos/src/design-system/tokens/gap.dart';
import 'package:ser_manos/src/design-system/tokens/shadows.dart';
import 'package:ser_manos/src/design-system/tokens/typography.dart';
import 'package:ser_manos/src/features/profile/models/location.dart';
import 'package:ser_manos/src/features/auth/models/information.dart';
import 'package:ser_manos/src/features/volunteer/presentation/volunteer_detail_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    required BuildContext context,
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
                    AppLocalizations.of(context)!.socialAction,
                    color: SMColors.neutral75,
                  ),
                  SMTypography.subtitle01(volunteering.name),
                ],
              ),
            ),
            const SMIcon(
              icon: Icons.location_on,
              active: true,
            ),
          ],
        ),
      ),
      onTap: () => Beamer.of(context).beamToNamed(
        "${VolunteerDetailScreen.route}?id=${volunteering.id}",
        beamBackOnPop: true,
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
    required BuildContext context,
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
                  AppLocalizations.of(context)!.male,
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
                  AppLocalizations.of(context)!.female,
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
                  AppLocalizations.of(context)!.nonBinary,
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
    required BuildContext context,
  }) {
    return SMCard(
      child: SMComponent.heading(
        title: AppLocalizations.of(context)!.ubication,
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
                        label: AppLocalizations.of(context)!.address,
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
    required BuildContext context,
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
                            AppLocalizations.of(context)!.readMore,
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

  factory SMCard.volunteerPostulationDetails(
      {Key? key,
      String? title,
      required String content,
      required String btnText,
      required Function() onBtnPressed,
      bool shouldDisable = false}) {
    return SMCard(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (title != null) SMTypography.headline02(title),
            if (title != null) const SMGap.vertical(height: 8),
            SMTypography.body01(
              content,
              align: TextAlign.center,
            ),
            const SMGap.vertical(height: 8),
            SMFill.horizontal(
              child: SMButton.text(
                btnText,
                disabled: shouldDisable,
                onPressed: onBtnPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }

  factory SMCard.noVolunteerings({
    Key? key,
    required BuildContext context,
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
            AppLocalizations.of(context)!.noVolunteerings,
            align: TextAlign.center,
          ),
        ),
      ),
    );
  }

  factory SMCard.profile({
    Key? key,
    ImageProvider? image,
    required void Function(XFile? image) onImagePicked,
    required BuildContext context,
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
              SMTypography.subtitle01(AppLocalizations.of(context)!.profilePic),
              if (image != null) const SMGap.vertical(height: 8),
              if (image != null)
                SMButton.shortSmall(
                  AppLocalizations.of(context)!.changePic,
                  onPressed: () => showOptions(context, onImagePicked, context),
                ),
            ],
          ),
          image == null
              ? SMButton.shortSmall(
                  AppLocalizations.of(context)!.uploadPic,
                  onPressed: () => showOptions(context, onImagePicked, context),
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
    required int vacancies,
    required bool isFavorite,
    EdgeInsetsGeometry? margin,
    void Function()? onTap,
    void Function()? onFavorite,
    void Function()? onLocation,
    bool isFavoriteEnabled = true,
    required BuildContext context,
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
                        AppLocalizations.of(context)!.socialAction,
                        color: SMColors.neutral75,
                      ),
                      SMTypography.subtitle01(volunteer.name),
                      const SMGap.vertical(
                        height: 4,
                      ),
                      SMComponent.vacancy(
                        context: context,
                        vacancies: vacancies,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (isFavoriteEnabled)
                      IconButton(
                        onPressed: onFavorite,
                        padding: EdgeInsets.zero,
                        visualDensity:
                            const VisualDensity(horizontal: -4, vertical: -4),
                        icon: SMIcon(
                          icon: isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          active: true,
                        ),
                      ),
                    if (isFavoriteEnabled)
                      const SizedBox(
                        width: 16,
                      ),
                    IconButton(
                      onPressed: onLocation,
                      padding: EdgeInsets.zero,
                      visualDensity:
                          const VisualDensity(horizontal: -4, vertical: -4),
                      icon: const SMIcon(
                        icon: Icons.location_on,
                        active: true,
                      ),
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

showOptions(BuildContext context, void Function(XFile? image) onImagePicked,
    BuildContext buildContext) {
  showCupertinoModalPopup(
    context: context,
    builder: (context) => CupertinoActionSheet(
      actions: [
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.of(context).pop();
            _selectImage(onImagePicked);
          },
          child: SMTypography.body01(AppLocalizations.of(context)!.galery),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            Navigator.of(context).pop();
            _selectCameraImage(onImagePicked);
          },
          child: SMTypography.body01(AppLocalizations.of(context)!.camera),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        onPressed: () => Navigator.of(context).pop(),
        child: SMTypography.body01(AppLocalizations.of(context)!.cancel),
      ),
    ),
  );
}

void _selectCameraImage(void Function(XFile? image) onImagePicked) {
  final ImagePicker picker = ImagePicker();
  picker.pickImage(source: ImageSource.camera).then((image) {
    if (image != null) {
      onImagePicked(image);
    }
  });
}

_selectImage(void Function(XFile? image) onImagePicked) async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(
    source: ImageSource.gallery,
  );
  if (image != null) {
    onImagePicked(image);
  }
}
