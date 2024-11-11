import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:ser_manos/src/core/interfaces/analytics_service.dart';
import 'package:ser_manos/src/core/services/analytics_service_impl.dart';
import 'package:ser_manos/src/core/services/remote_config_impl.dart';
part 'generated/firebase_provider.g.dart';

@Riverpod(keepAlive: true)
FirebaseAuth firebaseAuth(FirebaseAuthRef ref) {
  return FirebaseAuth.instance;
}

@Riverpod(keepAlive: true)
FirebaseFirestore firebaseFirestore(FirebaseFirestoreRef ref) {
  return FirebaseFirestore.instance;
}

@Riverpod(keepAlive: true)
FirebaseStorage firebaseStorage(FirebaseStorageRef ref) {
  return FirebaseStorage.instance;
}

@Riverpod(keepAlive: true)
FirebaseAnalytics firebaseAnalytics(FirebaseAnalyticsRef ref) {
  return FirebaseAnalytics.instance;
}

@riverpod
Future<RemoteConfigImpl> remoteConfig(RemoteConfigRef ref) async {
  final remoteConfig = FirebaseRemoteConfig.instance;
  final configImpl = RemoteConfigImpl(remoteConfig);
  await configImpl.initialize();
  return configImpl;
}

@riverpod
AnalyticsService analyticsService(AnalyticsServiceRef ref) {
  return AnalyticsServiceImpl(ref.read(firebaseAnalyticsProvider));
}
