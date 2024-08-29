import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ser_manos/features/volunteer/domain/voluntary.dart';
import 'package:ser_manos/shared/atoms/icon.dart';
import 'package:ser_manos/shared/cells/cards/c_voluntary.dart';
import 'package:ser_manos/shared/molecules/buttons/b_floating.dart';
import 'package:ser_manos/shared/molecules/inputs/search_input.dart';
import 'package:ser_manos/shared/tokens/colors.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

class MapFragment extends StatefulWidget {
  const MapFragment({
    super.key,
    required this.voluntaries,
    required this.onIconPressed,
  });
  final List<Voluntary> voluntaries;
  final void Function() onIconPressed;

  @override
  State<MapFragment> createState() => _MapFragmentState();
}

class _MapFragmentState extends State<MapFragment> {
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

    for (int i = 0; i < widget.voluntaries.length; i++) {
      final marker = Marker(
        markerId: MarkerId(widget.voluntaries[i].name),
        position: LatLng(widget.voluntaries[i].lat, widget.voluntaries[i].lng),
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
    final voluntary = widget.voluntaries[index];
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
              child: SearchInput(
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
                  child: BFloating(
                    Icons.near_me,
                    onPressed: () => {},
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: CarouselSlider(
                    items: widget.voluntaries
                        .map(
                          (voluntary) => CVoluntary(
                            voluntary: voluntary,
                            vacancies: 10,
                            margin: const EdgeInsets.only(right: 8),
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
