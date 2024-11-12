import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:ser_manos/src/core/interfaces/analytics_service.dart';
import 'package:ser_manos/src/core/services/analytics_service_impl.dart';
import 'package:ser_manos/src/core/services/remote_config_impl.dart';
part 'generated/firebase_provider.g.dart';

@Riverpod(keepAlive: true)
FirebaseAuth firebaseAuth(Ref ref) {
  return FirebaseAuth.instance;
}

@Riverpod(keepAlive: true)
FirebaseFirestore firebaseFirestore(Ref ref) {
  return FirebaseFirestore.instance;
}

@Riverpod(keepAlive: true)
FirebaseStorage firebaseStorage(Ref ref) {
  return FirebaseStorage.instance;
}

@Riverpod(keepAlive: true)
FirebaseAnalytics firebaseAnalytics(Ref ref) {
  return FirebaseAnalytics.instance;
}

@riverpod
Future<RemoteConfigImpl> remoteConfig(Ref ref) async {
  final remoteConfig = FirebaseRemoteConfig.instance;
  final configImpl = RemoteConfigImpl(remoteConfig);
  await configImpl.initialize();
  return configImpl;
}

@riverpod
AnalyticsService analyticsService(Ref ref) {
  return AnalyticsServiceImpl(ref.read(firebaseAnalyticsProvider));
}
