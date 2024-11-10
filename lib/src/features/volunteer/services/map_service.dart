import 'package:url_launcher/url_launcher.dart';

class MapService {
  MapService._();

  static Future<void> launchMap(double latitude, double longitude) async {
    Uri googleUrl = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');
    await launchUrl(googleUrl, mode: LaunchMode.externalApplication);
  }
}
