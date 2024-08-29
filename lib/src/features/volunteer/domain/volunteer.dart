final class Volunteer {
  final String imgURL;
  final String name;
  final double lat;
  final double lng;
  int vacancies = 0;

  Volunteer({
    required this.imgURL,
    required this.name,
    this.lat = 0,
    this.lng = 0,
    this.vacancies = 0,
  });
}
