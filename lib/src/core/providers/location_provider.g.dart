// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$locationRepositoryHash() =>
    r'4436342f416b1eef91fede0d88cad9e57b222688';

/// See also [locationRepository].
@ProviderFor(locationRepository)
final locationRepositoryProvider = Provider<LocationRepository>.internal(
  locationRepository,
  name: r'locationRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$locationRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LocationRepositoryRef = ProviderRef<LocationRepository>;
String _$currentLocationHash() => r'20b22301c66e1cb24d92a76e5138c558641941b6';

/// See also [currentLocation].
@ProviderFor(currentLocation)
final currentLocationProvider = FutureProvider<Location?>.internal(
  currentLocation,
  name: r'currentLocationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentLocationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentLocationRef = FutureProviderRef<Location?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
