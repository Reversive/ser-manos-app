abstract interface class AnalyticsService {
  Future<void> logVolunteeringApplied(String volunteeringId);
  Future<void> logVolunteeringCanceled(String volunteeringId);
  Future<void> logVolunteeringAbandoned(String volunteeringId);
  Future<void> logVolunteeringFavorite(String volunteeringId);
  Future<void> logVolunteeringUnfavorite(String volunteeringId);
  Future<void> logNewsShared(String newsId);
}
