import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:ser_manos/src/core/interfaces/location_repository.dart';
import 'package:ser_manos/src/core/persistence/location_repository_impl.dart';
import 'package:ser_manos/src/features/profile/models/location.dart';
part 'location_provider.g.dart';

@Riverpod(keepAlive: true)
LocationRepository locationRepository(LocationRepositoryRef ref) {
  return LocationRepositoryImpl();
}

@Riverpod(keepAlive: true)
Future<Location> currentLocation(CurrentLocationRef ref) async {
  return await ref.read(locationRepositoryProvider).getCurrentLocation();
}