import 'package:ser_manos/src/features/profile/models/location.dart';

abstract interface class LocationRepository {
  Future<Location> getCurrentLocation();
}