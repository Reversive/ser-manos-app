// import freezed lib
import 'package:freezed_annotation/freezed_annotation.dart';
part 'location.freezed.dart';
part 'location.g.dart';

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
