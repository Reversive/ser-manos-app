import 'package:flutter/material.dart';
import 'package:ser_manos/src/core/theme/colors.dart';
import 'package:ser_manos/src/features/profile/domain/location.dart';
import 'package:ser_manos/src/shared/cells/cards/card.dart';
import 'package:ser_manos/src/shared/cells/headers/header.dart';
import 'package:ser_manos/src/shared/molecules/buttons/button.dart';
import 'package:ser_manos/src/shared/molecules/components/component.dart';
import 'package:ser_manos/src/shared/tokens/fill.dart';
import 'package:ser_manos/src/shared/tokens/gap.dart';
import 'package:ser_manos/src/shared/tokens/grid.dart';
import 'package:ser_manos/src/shared/tokens/typography.dart';

// TODO: Dynamically get the volunteer data from the API
class VolunteerDetailScreen extends StatelessWidget {
  const VolunteerDetailScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: SMHeader.transparent(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SMFill.horizontal(
              child: Image.network(
                'https://s3-alpha-sig.figma.com/img/6160/48a8/56fafc1f797d16aeaaa7f76477bdc239?Expires=1725840000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=hbUF9cI0g1qgqgW5R~KNa55TyiNqQ-nL3LKycTdvbtCdYZbui7Hl48UAc8E8qzHZMgp5OBEiLHAz9eV68XI6z93SzyQvu7wahrjygwJIhvZBVtb0AqvoSLs4pY8oN5JXFLe4QH3nscC-FM4QlMRWJK~h8~rGcwnmatxwkWM5VZ~auNoj2TTf-azkVpz3t9CVCLs-kgYgTzsbRgtYgl0sG5uc0EwHsAzGm~J9JRf5-XHzbhBtPR-H2JgEjAm43pM1cJYayZ2o-01RcovO0~I52khYNsvr7fTCQht7vwyp5UzMKZqhszdvAuI~H3yf3nys7hI0lNfWbmUt5imQz8Md4Q__',
                fit: BoxFit.cover,
              ),
            ),
            SMGrid(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 24,
                  bottom: 32,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SMTypography.overline(
                      "ACCIÓN SOCIAL",
                      color: SMColors.neutral75,
                    ),
                    SMTypography.headline01("Un Techo para mi País"),
                    const SMGap.vertical(height: 16),
                    SMTypography.body01(
                      "El propósito principal de \"Un techo para mi país\" es reducir el déficit habitacional y mejorar las condiciones de vida de las personas que no tienen acceso a una vivienda adecuada.",
                      color: SMColors.secondary200,
                    ),
                    const SMGap.vertical(height: 24),
                    SMTypography.headline02("Sobre la actividad"),
                    const SMGap.vertical(height: 8),
                    SMTypography.body01(
                      "Te necesitamos para construir las viviendas de las personas que necesitan un techo. Estas están prefabricadas en madera y deberás ayudar en carpintería, montaje, pintura y demás actividades de la construcción.",
                    ),
                    const SMGap.vertical(height: 24),
                    SMCard.location(
                      hasEmbeddedMap: true,
                      location: Location(
                        street: "Echeverria",
                        number: 3560,
                        city: "Capital Federal",
                        state: "Buenos Aires",
                        lat: -34.62283169075434,
                        lng: -58.44644063941437,
                      ),
                    ),
                    const SMGap.vertical(height: 32),
                    SMTypography.headline02("Participar del voluntariado"),
                    const SMGap.vertical(height: 8),
                    SMTypography.subtitle01("Requisitos"),
                    const SMGap.vertical(height: 8),
                    SMComponent.bulletList(
                      items: const [
                        "Mayor de edad.",
                        "Poder levantar cosas pesadas.",
                      ],
                    ),
                    const SMGap.vertical(height: 8),
                    SMTypography.subtitle01("Dispobilidad"),
                    const SMGap.vertical(height: 8),
                    SMComponent.bulletList(
                      items: const [
                        "Sábados de 9 a 18hs.",
                        "Domingos de 9 a 18hs.",
                      ],
                    ),
                    const SMGap.vertical(height: 8),
                    SMComponent.vacancy(vacancies: 10),
                    const SMGap.vertical(height: 24),
                    SMFill.horizontal(
                      child: SMButton.filled(
                        "Postularme",
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
