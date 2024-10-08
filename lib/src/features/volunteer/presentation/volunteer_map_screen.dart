import 'package:beamer/beamer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ser_manos/src/features/volunteer/domain/volunteer.dart';
import 'package:ser_manos/src/features/volunteer/presentation/volunteer_screen.dart';
import 'package:ser_manos/src/shared/atoms/icon.dart';
import 'package:ser_manos/src/shared/cells/cards/card.dart';
import 'package:ser_manos/src/shared/molecules/buttons/button.dart';
import 'package:ser_manos/src/shared/molecules/inputs/search_input.dart';
import 'package:ser_manos/src/core/theme/colors.dart';
import 'package:ser_manos/src/shared/tokens/gap.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

class VolunteerMapScreen extends HookWidget {
  const VolunteerMapScreen({
    super.key,
    required this.volunteers,
    required this.onIconPressed,
  });
  final List<Volunteer> volunteers;
  final void Function() onIconPressed;

  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(
      -34.62283169075434,
      -58.44644063941437,
    ),
    zoom: 14,
  );

  @override
  Widget build(BuildContext context) {
    final mapController = useState<GoogleMapController?>(null);
    final markers = useState(<Marker>{});
    final locationOn = useState(BitmapDescriptor.defaultMarker);
    final locationOnOutlined = useState(BitmapDescriptor.defaultMarker);

    void onPageChanged(int index, CarouselPageChangedReason reason) {
      final voluntary = volunteers[index];
      final marker = markers.value.firstWhere(
        (element) => element.markerId.value == voluntary.name,
      );

      mapController.value!.animateCamera(
        CameraUpdate.newLatLng(marker.position),
      );

      markers.value = markers.value.map((e) {
        if (e.markerId.value == voluntary.name) {
          return e.copyWith(iconParam: locationOn.value);
        }
        return e.copyWith(iconParam: locationOnOutlined.value);
      }).toSet();
    }

    void initMarkers() async {
      locationOn.value = await const SMIcon(
        size: 32,
        icon: Icons.location_on,
        activeColor: SMColors.secondary200,
        active: true,
      ).toBitmapDescriptor();

      locationOnOutlined.value = await const SMIcon(
        size: 32,
        icon: Icons.location_on_outlined,
        activeColor: SMColors.secondary200,
        active: true,
      ).toBitmapDescriptor();

      for (int i = 0; i < volunteers.length; i++) {
        final marker = Marker(
          markerId: MarkerId(volunteers[i].name),
          position: LatLng(
            volunteers[i].location.lat,
            volunteers[i].location.lng,
          ),
          icon: i == 0 ? locationOn.value : locationOnOutlined.value,
        );
        markers.value.add(marker);
      }
    }

    useEffect(() {
      initMarkers();
      return null;
    }, const []);

    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: _initialPosition,
          zoomControlsEnabled: false,
          zoomGesturesEnabled: false,
          markers: markers.value,
          onMapCreated: (controller) {
            mapController.value = controller;
          },
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 24,
                left: 16,
                right: 16,
              ),
              child: SMSearchInput(
                onIconPressed: onIconPressed,
                suffixIcon: Icons.list,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 16,
                  ),
                  child: SMButton.floating(
                    icon: Icons.near_me,
                    onPressed: () => {},
                  ),
                ),
                const SMGap.vertical(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: volunteers.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                          child: SMCard.noVolunteerings(),
                        )
                      : CarouselSlider(
                          items: volunteers
                              .map(
                                (voluntary) => SMCard.volunteer(
                                  volunteer: voluntary,
                                  margin: const EdgeInsets.only(right: 8),
                                  onTap: () => Beamer.of(context).beamToNamed(
                                    '${VolunteerScreen.route}?id=${volunteers.indexOf(voluntary)}',
                                    beamBackOnPop: true,
                                  ),
                                ),
                              )
                              .toList(),
                          options: CarouselOptions(
                            enableInfiniteScroll: false,
                            height: 236,
                            viewportFraction: 0.87,
                            onPageChanged: onPageChanged,
                          ),
                        ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
