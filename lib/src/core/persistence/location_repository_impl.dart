import 'package:geolocator/geolocator.dart' as gl;
import 'package:ser_manos/src/core/interfaces/location_repository.dart';
import 'package:ser_manos/src/features/profile/models/location.dart';

class LocationRepositoryImpl implements LocationRepository {
  @override
  Future<Location> getCurrentLocation() async {
    try {
      gl.LocationPermission permission = await _checkPermission();
      if (permission == gl.LocationPermission.denied ||
          permission == gl.LocationPermission.deniedForever) {
        return Future.error("Permission denied");
      }
      gl.Position? position = await gl.Geolocator.getCurrentPosition();
      return Location.fromCoords(position.latitude, position.longitude);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<gl.LocationPermission> _checkPermission() async {
    gl.LocationPermission permission = await gl.Geolocator.checkPermission();
    if (permission == gl.LocationPermission.denied ||
        permission == gl.LocationPermission.deniedForever) {
      permission = await gl.Geolocator.requestPermission();
    }
    return permission;
  }
}
