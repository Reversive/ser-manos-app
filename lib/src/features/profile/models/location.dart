import 'dart:math';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'generated/location.freezed.dart';
part 'generated/location.g.dart';

@freezed
class Location with _$Location {
  const factory Location({
    required String city,
    required double lat,
    required double lng,
    required int number,
    required String state,
    required String street,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  factory Location.fromCoords(double lat, double lng) {
    return Location(
      city: '',
      lat: lat,
      lng: lng,
      number: 0,
      state: '',
      street: '',
    );
  }
}

extension LocationDistance on Location {
  double distanceTo(Location other) {
    const p = 0.017453292519943295;
    final a = 0.5 -
        cos((other.lat - lat) * p) / 2 +
        cos(lat * p) *
            cos(other.lat * p) *
            (1 - cos((other.lng - lng) * p)) /
            2;
    return 12742 * asin(sqrt(a));
  }
}