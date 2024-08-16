import 'package:flutter/material.dart';
import 'package:ser_manos/layers/domain/models/location.dart';
import 'package:ser_manos/layers/presentation/atoms/icon.dart';
import 'package:ser_manos/layers/presentation/molecules/components/c_heading.dart';
import 'package:ser_manos/layers/presentation/molecules/components/c_labeled_content.dart';
import 'package:ser_manos/layers/presentation/tokens/colors.dart';

class CLocation extends CHeading {
  CLocation({
    super.key,
    required Location location,
    bool hasEmbeddedMap = false,
  }) : super(
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
                            child: const Image(
                              image: NetworkImage(
                                "https://s3-alpha-sig.figma.com/img/ebb0/4ca0/233a290789f277900cc8cf2219381673?Expires=1724630400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=TYXB0jnV2-x0tQXO~cAZ6EHuj9luZ6luBzPrsK3PFT9QvPYiXwzmv~spxzhMDlP0TXETseJGYz7ExUYSGGhUoTa-uQsVyVajId7ZUm99PPpCx2bLAC9ALeAOMpKkW9wFGi3NrT4xcCh5~KnYym48jnXHQmSA3r8oVY-pZ7zLpcC0FUJ~6ZiKeYXMY3WOEmPucvdo~EhGktwGxl3jt-fTBXdWzD-oRuX4-2io1Yd0EsouCOA0~3HDPKtlIOx7spiU5eyC-hyEX2l4Pj6LjSdq6DK0oEzya3iYcklTrNJQq8nMQ82IVZNuP6H7F~XEAtS~rfeyTsewcJ53XGcy1WZUHw__",
                              ),
                              fit: BoxFit.cover,
                              height: 155,
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
                          CLabeledContent(
                            label: "dirección",
                            content:
                                '${location.street} ${location.number}, ${location.city}, ${location.state}.',
                          ),
                          hasEmbeddedMap
                              ? Container()
                              : const SMIcon(
                                  icon: Icons.location_on,
                                ),
                        ],
                      ),
                    ),
                  ],
                )));
}
