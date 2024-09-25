// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$newsRepositoryHash() => r'86dfbc153753d212db9db90af104fb945d85f5f3';

/// See also [newsRepository].
@ProviderFor(newsRepository)
final newsRepositoryProvider = Provider<NewsRepository>.internal(
  newsRepository,
  name: r'newsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$newsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NewsRepositoryRef = ProviderRef<NewsRepository>;
String _$newsServiceHash() => r'61c8893e8be19c27e5dea4619ff48a3ba770a536';

/// See also [newsService].
@ProviderFor(newsService)
final newsServiceProvider = Provider<NewsService>.internal(
  newsService,
  name: r'newsServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$newsServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NewsServiceRef = ProviderRef<NewsService>;
String _$newsListHash() => r'59996897e2a266bfae6e80b1746c7945639adc45';

/// See also [newsList].
@ProviderFor(newsList)
final newsListProvider = AutoDisposeFutureProvider<List<News>>.internal(
  newsList,
  name: r'newsListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$newsListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NewsListRef = AutoDisposeFutureProviderRef<List<News>>;
String _$newsDetailHash() => r'daf5584fcd60faa3643cbe39ce8137d54f4bfa18';

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

/// See also [newsDetail].
@ProviderFor(newsDetail)
const newsDetailProvider = NewsDetailFamily();

/// See also [newsDetail].
class NewsDetailFamily extends Family<AsyncValue<News>> {
  /// See also [newsDetail].
  const NewsDetailFamily();

  /// See also [newsDetail].
  NewsDetailProvider call(
    String id,
  ) {
    return NewsDetailProvider(
      id,
    );
  }

  @override
  NewsDetailProvider getProviderOverride(
    covariant NewsDetailProvider provider,
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
  String? get name => r'newsDetailProvider';
}

/// See also [newsDetail].
class NewsDetailProvider extends AutoDisposeFutureProvider<News> {
  /// See also [newsDetail].
  NewsDetailProvider(
    String id,
  ) : this._internal(
          (ref) => newsDetail(
            ref as NewsDetailRef,
            id,
          ),
          from: newsDetailProvider,
          name: r'newsDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$newsDetailHash,
          dependencies: NewsDetailFamily._dependencies,
          allTransitiveDependencies:
              NewsDetailFamily._allTransitiveDependencies,
          id: id,
        );

  NewsDetailProvider._internal(
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
    FutureOr<News> Function(NewsDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: NewsDetailProvider._internal(
        (ref) => create(ref as NewsDetailRef),
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
  AutoDisposeFutureProviderElement<News> createElement() {
    return _NewsDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NewsDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin NewsDetailRef on AutoDisposeFutureProviderRef<News> {
  /// The parameter `id` of this provider.
  String get id;
}

class _NewsDetailProviderElement extends AutoDisposeFutureProviderElement<News>
    with NewsDetailRef {
  _NewsDetailProviderElement(super.provider);

  @override
  String get id => (origin as NewsDetailProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
