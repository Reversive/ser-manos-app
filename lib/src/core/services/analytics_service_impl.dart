import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:ser_manos/src/core/interfaces/analytics_service.dart';

class AnalyticsServiceImpl implements AnalyticsService {
  final FirebaseAnalytics _analytics;

  AnalyticsServiceImpl(this._analytics);

  @override
  Future<void> logNewsShared(String newsId) {
    return _analytics
        .logEvent(name: 'news_shared', parameters: {'news_id': newsId});
  }

  @override
  Future<void> logVolunteeringAbandoned(String volunteeringId) {
    return _analytics.logEvent(
        name: 'volunteering_abandoned',
        parameters: {'volunteering_id': volunteeringId});
  }

  @override
  Future<void> logVolunteeringApplied(String volunteeringId) {
    return _analytics.logEvent(
        name: 'volunteering_applied',
        parameters: {'volunteering_id': volunteeringId});
  }

  @override
  Future<void> logVolunteeringCanceled(String volunteeringId) {
    return _analytics.logEvent(
        name: 'volunteering_canceled',
        parameters: {'volunteering_id': volunteeringId});
  }

  @override
  Future<void> logVolunteeringFavorite(String volunteeringId) {
    return _analytics.logEvent(
        name: 'volunteering_favorite',
        parameters: {'volunteering_id': volunteeringId});
  }

  @override
  Future<void> logVolunteeringUnfavorite(String volunteeringId) {
    return _analytics.logEvent(
        name: 'volunteering_unfavorite',
        parameters: {'volunteering_id': volunteeringId});
  }
}
