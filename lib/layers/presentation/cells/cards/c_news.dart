import 'package:flutter/material.dart';
import 'package:ser_manos/layers/domain/models/news.dart';
import 'package:ser_manos/layers/presentation/tokens/colors.dart';
import 'package:ser_manos/layers/presentation/tokens/decorations/bd_card.dart';
import 'package:ser_manos/layers/presentation/tokens/typographies/t_body02.dart';
import 'package:ser_manos/layers/presentation/tokens/typographies/t_button.dart';
import 'package:ser_manos/layers/presentation/tokens/typographies/t_overline.dart';
import 'package:ser_manos/layers/presentation/tokens/typographies/t_subtitle01.dart';

final class CNews extends IntrinsicHeight {
  final News news;
  CNews({super.key, required this.news})
      : super(
          child: Container(
            decoration: BDCard(),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image(
                  image: NetworkImage(news.imgURL),
                  fit: BoxFit.cover,
                  width: 118,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TOverline(
                          news.name,
                          color: SMColors.neutral75,
                        ),
                        const SizedBox(height: 4),
                        TSubtitle1(news.title),
                        const SizedBox(height: 4),
                        TBody2(
                          news.description,
                          color: SMColors.neutral75,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
                              child: TButton("Leer Más"),
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
