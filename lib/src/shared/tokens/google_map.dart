import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ser_manos/src/core/theme/colors.dart';
import 'package:ser_manos/src/shared/atoms/icon.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

class SMGoogleMap extends HookWidget {
  const SMGoogleMap({
    super.key,
    required this.cameraPosition,
    required this.location,
  });

  final CameraPosition cameraPosition;
  final LatLng location;

  @override
  Widget build(BuildContext context) {
    final markers = useState(<Marker>{});
    final locationIcon = useState(BitmapDescriptor.defaultMarker);

    void initMarkers() async {
      locationIcon.value = await const SMIcon(
        size: 32,
        icon: Icons.location_on,
        activeColor: SMColors.primary100,
        active: true,
      ).toBitmapDescriptor();

      markers.value.add(
        Marker(
          markerId: const MarkerId("volunteer-location"),
          position: LatLng(
            location.latitude,
            location.longitude,
          ),
          icon: locationIcon.value,
        ),
      );
    }

    useEffect(() {
      initMarkers();
    }, const []);

    return GoogleMap(
      zoomControlsEnabled: false,
      zoomGesturesEnabled: false,
      initialCameraPosition: cameraPosition,
      markers: markers.value,
    );
  }
}
