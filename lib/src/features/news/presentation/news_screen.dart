import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ser_manos/src/core/theme/colors.dart';
import 'package:ser_manos/src/features/news/domain/news.dart';
import 'package:ser_manos/src/shared/cells/cards/card.dart';
import 'package:ser_manos/src/shared/tokens/gap.dart';
import 'package:ser_manos/src/shared/tokens/grid.dart';

class NewsScreen extends StatefulWidget {
  static const String route = '/home/news';
  static const String routeName = 'news';
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

final news = [
  News(
    imgURL:
        "https://s3-alpha-sig.figma.com/img/839a/009b/380a4b7407209dad0aeec257c6df7298?Expires=1726444800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=j5POrIzEFsSMEIFYDf7blz8btdgb9Dt80n78cWQhVPcmfuk2mpjBpnd62ZATiidDiV3t7o7CxZqKP2hQiNFVYBzwyV6u09Z9LrFltPCvQAcnLRJjbCRTBvxgEzIsWRdIQXTu7~ySIRrCHC~Y62MAa0a6D7bTh6MmoyHIajC-~clVN2dTziGyrqDfy7wkB3t5h9xhxEHSgFHkL2rqhp~6xPnwqwsd4SQi-Ks9r5pGRQYnLnsmOK5VmtbyIo~qC3rRHIRQHYupej6Y~QPZcSJSqyXEsBMZHzKtQjn7sKIXtYnOt0q1JUY8IxtnitGw-yBO61j1qFF4Nk-0KWQjvCojIA__",
    source: "REPORTE 2820",
    title: "Ser donante voluntario",
    summary:
        "Desde el Hospital Centenario recalcan la importancia de la donación voluntaria de Sangre",
    content: "",
  ),
  News(
    imgURL:
        "https://s3-alpha-sig.figma.com/img/9d9d/8b2b/1b4848e87872562e2c1a855aa6f6ff14?Expires=1726444800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=KnnrRPLBD-oRPVKeP2UsLeKEhK84MjxncbPXALkpSpjkuQSfe6cTtRrvn-J7L0tjyBUjMa~okY~Xq-L4AGO5fcoSijpYJAZz41P2ua8VhIGEHNcOT6zZN9PVuQuU-owDrhnQ-gLjapdRrwSublbDHIiFw7o1olpRpHGB3kDAQ7WmMbYjU7iRaonH2u1bNrYPqKVkjyVMglaVTuOvtOYRLygD4GdFcNz32q093E1UUL3~H-smeh5vfrFcaWlFiwY691s4PcnxwLb-hrrfek84334vM1pfGp-4qUNfGfZu2BcnvMqenaNnPlQkS~lt8Vnli4i0LGPyh0DeK6Xh8T3u7w__",
    source: "Noticias de cuyo",
    title: "Juntamos residuos",
    summary:
        "Voluntarios de Godoy Cruz, se sumaron a la limpieza de un cauce en las inmediaciones.",
    content: "",
  ),
];

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: SMColors.secondary10,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 16,
        ),
        child: SMGrid(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return SMCard.news(
                news: news[index],
                onPressed: () => Beamer.of(context).beamToNamed(
                  "${NewsScreen.route}?id=$index",
                  beamBackOnPop: true,
                ),
              );
            },
            separatorBuilder: (context, index) =>
                const SMGap.vertical(height: 24),
            itemCount: news.length,
          ),
        ),
      ),
    );
  }
}
