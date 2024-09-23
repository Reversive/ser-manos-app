import 'package:ser_manos/src/features/profile/models/location.dart';

final class Volunteer {
  final String imgURL;
  final String name;
  final Location location;
  final int vacancies;

  const Volunteer({
    required this.imgURL,
    required this.name,
    required this.location,
    this.vacancies = 0,
  });
}
