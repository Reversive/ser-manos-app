import 'package:ser_manos/src/features/profile/models/location.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/volunteering.freezed.dart';
part 'generated/volunteering.g.dart';

@freezed
class Volunteering with _$Volunteering {
  const factory Volunteering({
    required String id,
    required String about,
    required List<String> availability,
    required String imageUrl,
    required Location location,
    required String name,
    required String purpose,
    required List<String> requirements,
    required int vacancies,
    required double creationDate,
  }) = _Volunteering;

  factory Volunteering.fromJson(Map<String, dynamic> json) =>
      _$VolunteeringFromJson(json);
}
