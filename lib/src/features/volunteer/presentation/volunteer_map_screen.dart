import 'package:beamer/beamer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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

class VolunteerMapScreen extends StatefulWidget {
  const VolunteerMapScreen({
    super.key,
    required this.volunteers,
    required this.onIconPressed,
  });
  final List<Volunteer> volunteers;
  final void Function() onIconPressed;

  @override
  State<VolunteerMapScreen> createState() => _VolunteerMapScreenState();
}

class _VolunteerMapScreenState extends State<VolunteerMapScreen> {
  TextEditingController searchController = TextEditingController();
  late GoogleMapController mapController;
  final CameraPosition _initialPosition = const CameraPosition(
    target: LatLng(
      -34.62283169075434,
      -58.44644063941437,
    ),
    zoom: 14,
  );
  String? validator(String? value) => null;
  Set<Marker> markers = {};
  late BitmapDescriptor locationOn;
  late BitmapDescriptor locationOnOutlined;

  void initMarkers() async {
    locationOn = await const SMIcon(
      size: 32,
      icon: Icons.location_on,
      activeColor: SMColors.secondary200,
      active: true,
    ).toBitmapDescriptor();

    locationOnOutlined = await const SMIcon(
      size: 32,
      icon: Icons.location_on_outlined,
      activeColor: SMColors.secondary200,
      active: true,
    ).toBitmapDescriptor();

    for (int i = 0; i < widget.volunteers.length; i++) {
      final marker = Marker(
        markerId: MarkerId(widget.volunteers[i].name),
        position: LatLng(
          widget.volunteers[i].location.lat,
          widget.volunteers[i].location.lng,
        ),
        icon: i == 0 ? locationOn : locationOnOutlined,
      );
      markers.add(marker);
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initMarkers();
  }

  void onPageChanged(int index, CarouselPageChangedReason reason) {
    final voluntary = widget.volunteers[index];
    final marker = markers.firstWhere(
      (element) => element.markerId.value == voluntary.name,
    );

    mapController.animateCamera(
      CameraUpdate.newLatLng(marker.position),
    );

    markers = markers.map((e) {
      if (e.markerId.value == voluntary.name) {
        return e.copyWith(iconParam: locationOn);
      }
      return e.copyWith(iconParam: locationOnOutlined);
    }).toSet();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: _initialPosition,
          zoomControlsEnabled: false,
          zoomGesturesEnabled: false,
          markers: markers,
          onMapCreated: (controller) {
            mapController = controller;
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
                controller: searchController,
                validator: validator,
                onIconPressed: widget.onIconPressed,
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
                  child: widget.volunteers.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                          child: SMCard.noVolunteerings(),
                        )
                      : CarouselSlider(
                          items: widget.volunteers
                              .map(
                                (voluntary) => SMCard.volunteer(
                                  volunteer: voluntary,
                                  margin: const EdgeInsets.only(right: 8),
                                  onTap: () => Beamer.of(context).beamToNamed(
                                    '${VolunteerScreen.route}?id=${widget.volunteers.indexOf(voluntary)}',
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
