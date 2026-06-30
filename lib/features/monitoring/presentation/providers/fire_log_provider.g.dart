// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fire_log_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fireLogsHash() => r'a4bb157a7d0ec4dacce6e3944285456905486810';

/// See also [fireLogs].
@ProviderFor(fireLogs)
final fireLogsProvider =
    AutoDisposeFutureProvider<List<FireLogDetail>>.internal(
      fireLogs,
      name: r'fireLogsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$fireLogsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FireLogsRef = AutoDisposeFutureProviderRef<List<FireLogDetail>>;
String _$fireLogDetailsHash() => r'e4b63bc9d591de8ef2de1d6ba950cbd44cd90873';

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

/// See also [fireLogDetails].
@ProviderFor(fireLogDetails)
const fireLogDetailsProvider = FireLogDetailsFamily();

/// See also [fireLogDetails].
class FireLogDetailsFamily extends Family<AsyncValue<FireLogDetail>> {
  /// See also [fireLogDetails].
  const FireLogDetailsFamily();

  /// See also [fireLogDetails].
  FireLogDetailsProvider call(int id) {
    return FireLogDetailsProvider(id);
  }

  @override
  FireLogDetailsProvider getProviderOverride(
    covariant FireLogDetailsProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fireLogDetailsProvider';
}

/// See also [fireLogDetails].
class FireLogDetailsProvider extends AutoDisposeFutureProvider<FireLogDetail> {
  /// See also [fireLogDetails].
  FireLogDetailsProvider(int id)
    : this._internal(
        (ref) => fireLogDetails(ref as FireLogDetailsRef, id),
        from: fireLogDetailsProvider,
        name: r'fireLogDetailsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$fireLogDetailsHash,
        dependencies: FireLogDetailsFamily._dependencies,
        allTransitiveDependencies:
            FireLogDetailsFamily._allTransitiveDependencies,
        id: id,
      );

  FireLogDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<FireLogDetail> Function(FireLogDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FireLogDetailsProvider._internal(
        (ref) => create(ref as FireLogDetailsRef),
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
  AutoDisposeFutureProviderElement<FireLogDetail> createElement() {
    return _FireLogDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FireLogDetailsProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FireLogDetailsRef on AutoDisposeFutureProviderRef<FireLogDetail> {
  /// The parameter `id` of this provider.
  int get id;
}

class _FireLogDetailsProviderElement
    extends AutoDisposeFutureProviderElement<FireLogDetail>
    with FireLogDetailsRef {
  _FireLogDetailsProviderElement(super.provider);

  @override
  int get id => (origin as FireLogDetailsProvider).id;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
