import 'package:flutter/material.dart';
import 'package:ser_manos/shared/molecules/buttons/b_short_small.dart';
import 'package:ser_manos/shared/molecules/components/c_profile_picture.dart';
import 'package:ser_manos/shared/tokens/colors.dart';
import 'package:ser_manos/shared/tokens/decorations/bd_card.dart';
import 'package:ser_manos/shared/tokens/typographies/t_subtitle01.dart';

class CProfile extends Container {
  CProfile({
    super.key,
    ImageProvider? image,
  }) : super(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            decoration: BDCard(
              color: SMColors.secondary25,
              radius: 4.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TSubtitle1("Foto de perfil"),
                    if (image != null) const SizedBox(height: 8),
                    if (image != null)
                      BShortSmall(
                        "Cambiar foto",
                        onPressed: () => {},
                      ),
                  ],
                ),
                image == null
                    ? BShortSmall(
                        "Subir foto",
                        onPressed: () => {},
                      )
                    : CProfilePicture.small(
                        image: image,
                      ),
              ],
            ));
}
