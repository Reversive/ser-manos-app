import 'package:flutter/material.dart';
import 'package:ser_manos/src/core/theme/colors.dart';
import 'package:ser_manos/src/features/news/domain/news.dart';
import 'package:ser_manos/src/shared/cells/headers/header.dart';
import 'package:ser_manos/src/shared/molecules/buttons/button.dart';
import 'package:ser_manos/src/shared/tokens/fill.dart';
import 'package:ser_manos/src/shared/tokens/gap.dart';
import 'package:ser_manos/src/shared/tokens/grid.dart';
import 'package:ser_manos/src/shared/tokens/typography.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({super.key, required this.id});

  static const newsMock = News(
    imgURL:
        "https://s3-alpha-sig.figma.com/img/839a/009b/380a4b7407209dad0aeec257c6df7298?Expires=1726444800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=j5POrIzEFsSMEIFYDf7blz8btdgb9Dt80n78cWQhVPcmfuk2mpjBpnd62ZATiidDiV3t7o7CxZqKP2hQiNFVYBzwyV6u09Z9LrFltPCvQAcnLRJjbCRTBvxgEzIsWRdIQXTu7~ySIRrCHC~Y62MAa0a6D7bTh6MmoyHIajC-~clVN2dTziGyrqDfy7wkB3t5h9xhxEHSgFHkL2rqhp~6xPnwqwsd4SQi-Ks9r5pGRQYnLnsmOK5VmtbyIo~qC3rRHIRQHYupej6Y~QPZcSJSqyXEsBMZHzKtQjn7sKIXtYnOt0q1JUY8IxtnitGw-yBO61j1qFF4Nk-0KWQjvCojIA__",
    source: "REPORTE 2820",
    title: "Ser donante voluntario",
    summary:
        "Desde el Hospital Centenario recalcan la importancia de la donación voluntaria de Sangre",
    content:
        "En un esfuerzo por concienciar sobre la necesidad constante de sangre y sus componentes, el Hospital Centenario destaca la importancia de convertirse en un donante voluntario. La donación de sangre es un acto solidario y altruista que puede salvar vidas y mejorar la salud de aquellos que enfrentan enfermedades graves o accidentes.La donación voluntaria de sangre desempeña un papel vital en el sistema de salud. A diferencia de la donación de sangre por reposición, donde se solicita a familiares y amigos donar para un paciente específico, la donación voluntaria se realiza sin ninguna conexión directa con un receptor particular. Esto garantiza un suministro constante y seguro de sangre y productos sanguíneos para todos aquellos que lo necesiten. Los beneficios de ser donante voluntario son numerosos. Además de la satisfacción de ayudar a quienes más lo necesitan, la donación de sangre tiene beneficios para la salud del propio donante. Al donar sangre, se realiza un chequeo médico que incluye pruebas para detectar enfermedades transmisibles, lo que puede proporcionar una evaluación temprana y ayuda en el diagnóstico de posibles problemas de salud.",
  );

  final String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SMHeader.section(subtitle: "Novedades"),
      backgroundColor: SMColors.neutral0,
      body: Padding(
        padding: const EdgeInsets.only(top: 24),
        child: SMGrid(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SMTypography.overline(
                  newsMock.source,
                  color: SMColors.neutral75,
                ),
                SMTypography.headline02(newsMock.title),
                const SMGap.vertical(height: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    newsMock.imgURL,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                const SMGap.vertical(height: 16),
                SMTypography.subtitle01(
                  newsMock.summary,
                  color: SMColors.secondary200,
                ),
                const SMGap.vertical(height: 16),
                SMTypography.body01(newsMock.content),
                const SMGap.vertical(height: 16),
                Align(
                  alignment: Alignment.center,
                  child: SMTypography.headline02("Comparte esta nota"),
                ),
                const SMGap.vertical(height: 16),
                Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: SMFill.horizontal(
                    child: SMButton.filled(
                      "Compartir",
                      onPressed: () {
                        // TODO: implement share functionality
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
