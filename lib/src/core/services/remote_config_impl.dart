import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:ser_manos/src/core/interfaces/remote_config.dart';

class RemoteConfigImpl implements RemoteConfig {
  final FirebaseRemoteConfig _remoteConfig;
  RemoteConfigImpl(FirebaseRemoteConfig remoteConfig)
      : _remoteConfig = remoteConfig;

  @override
  Future<void> initialize() async {
    await _remoteConfig.setDefaults(_defaults);
    await _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 5),
        minimumFetchInterval: const Duration(seconds: 0),
      ),
    );
    await _remoteConfig.fetchAndActivate();
    _remoteConfig.onConfigUpdated.listen((configUpdate) {
      _remoteConfig.activate();
    });
  }

  static const String _enableVolunteeringFavorite =
      'volunteering_enable_favorite';
  bool get enableVolunteeringFavorite =>
      _remoteConfig.getBool(_enableVolunteeringFavorite);

  static const String _enableNewsSharing = 'news_enable_sharing';
  bool get enableNewsSharing => _remoteConfig.getBool(_enableNewsSharing);

  static const String _enableDetailFavoriteButton =
      'volunteering_detail_favorite_button';
  bool get enableDetailFavoriteButton =>
      _remoteConfig.getBool(_enableDetailFavoriteButton);

  final Map<String, dynamic> _defaults = {
    _enableVolunteeringFavorite: false,
    _enableNewsSharing: false,
    _enableDetailFavoriteButton: false,
  };
}
