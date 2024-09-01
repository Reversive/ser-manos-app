import 'package:ser_manos/src/features/profile/domain/location.dart';

final class Volunteer {
  final String imgURL;
  final String name;
  final Location location;
  int vacancies = 0;

  Volunteer({
    required this.imgURL,
    required this.name,
    required this.location,
    this.vacancies = 0,
  });
}
