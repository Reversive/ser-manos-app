// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volunteering_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$volunteeringRepositoryHash() =>
    r'f1f571546c3eaa53bae7603cf24dba92c7979ee8';

/// See also [volunteeringRepository].
@ProviderFor(volunteeringRepository)
final volunteeringRepositoryProvider =
    Provider<VolunteeringRepository>.internal(
  volunteeringRepository,
  name: r'volunteeringRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$volunteeringRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef VolunteeringRepositoryRef = ProviderRef<VolunteeringRepository>;
String _$volunteeringServiceHash() =>
    r'5223b3cd1a2c35644e1381772c4f076bc704f28a';

/// See also [volunteeringService].
@ProviderFor(volunteeringService)
final volunteeringServiceProvider = Provider<VolunteeringService>.internal(
  volunteeringService,
  name: r'volunteeringServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$volunteeringServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef VolunteeringServiceRef = ProviderRef<VolunteeringService>;
String _$volunteeringListHash() => r'b7ff3b2501ff864e32288a4b450226b4bd246361';

/// See also [volunteeringList].
@ProviderFor(volunteeringList)
final volunteeringListProvider =
    AutoDisposeStreamProvider<List<Volunteering>>.internal(
  volunteeringList,
  name: r'volunteeringListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$volunteeringListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef VolunteeringListRef = AutoDisposeStreamProviderRef<List<Volunteering>>;
String _$volunteeringDetailHash() =>
    r'7e241273a389b07e81b64aeb2bad62a4ac4e4ab9';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [volunteeringDetail].
@ProviderFor(volunteeringDetail)
const volunteeringDetailProvider = VolunteeringDetailFamily();

/// See also [volunteeringDetail].
class VolunteeringDetailFamily extends Family<AsyncValue<Volunteering>> {
  /// See also [volunteeringDetail].
  const VolunteeringDetailFamily();

  /// See also [volunteeringDetail].
  VolunteeringDetailProvider call(
    String id,
  ) {
    return VolunteeringDetailProvider(
      id,
    );
  }

  @override
  VolunteeringDetailProvider getProviderOverride(
    covariant VolunteeringDetailProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'volunteeringDetailProvider';
}

/// See also [volunteeringDetail].
class VolunteeringDetailProvider
    extends AutoDisposeFutureProvider<Volunteering> {
  /// See also [volunteeringDetail].
  VolunteeringDetailProvider(
    String id,
  ) : this._internal(
          (ref) => volunteeringDetail(
            ref as VolunteeringDetailRef,
            id,
          ),
          from: volunteeringDetailProvider,
          name: r'volunteeringDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$volunteeringDetailHash,
          dependencies: VolunteeringDetailFamily._dependencies,
          allTransitiveDependencies:
              VolunteeringDetailFamily._allTransitiveDependencies,
          id: id,
        );

  VolunteeringDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<Volunteering> Function(VolunteeringDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VolunteeringDetailProvider._internal(
        (ref) => create(ref as VolunteeringDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Volunteering> createElement() {
    return _VolunteeringDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VolunteeringDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin VolunteeringDetailRef on AutoDisposeFutureProviderRef<Volunteering> {
  /// The parameter `id` of this provider.
  String get id;
}

class _VolunteeringDetailProviderElement
    extends AutoDisposeFutureProviderElement<Volunteering>
    with VolunteeringDetailRef {
  _VolunteeringDetailProviderElement(super.provider);

  @override
  String get id => (origin as VolunteeringDetailProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
