import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ser_manos/src/core/theme/colors.dart';
import 'package:ser_manos/src/shared/atoms/icon.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

class SMGoogleMap extends StatefulWidget {
  const SMGoogleMap({
    super.key,
    required this.cameraPosition,
    required this.location,
  });

  final CameraPosition cameraPosition;
  final LatLng location;

  @override
  State<SMGoogleMap> createState() => SMGoogleMapState();
}

class SMGoogleMapState extends State<SMGoogleMap> {
  late BitmapDescriptor location;
  final Set<Marker> markers = {};

  void initMarkers() async {
    location = await const SMIcon(
      size: 32,
      icon: Icons.location_on,
      activeColor: SMColors.primary100,
      active: true,
    ).toBitmapDescriptor();

    markers.add(
      Marker(
        markerId: const MarkerId("volunteer-location"),
        position: LatLng(
          widget.location.latitude,
          widget.location.longitude,
        ),
        icon: location,
      ),
    );
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initMarkers();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      zoomControlsEnabled: false,
      zoomGesturesEnabled: false,
      initialCameraPosition: widget.cameraPosition,
      markers: markers,
    );
  }
}
