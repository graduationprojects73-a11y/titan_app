// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ppe_log_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$ppeLogsHash() => r'24e9529c6ba45542ffaa95424615c046e2d78afb';

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

/// See also [ppeLogs].
@ProviderFor(ppeLogs)
const ppeLogsProvider = PpeLogsFamily();

/// See also [ppeLogs].
class PpeLogsFamily extends Family<AsyncValue<PpeLogResponse>> {
  /// See also [ppeLogs].
  const PpeLogsFamily();

  /// See also [ppeLogs].
  PpeLogsProvider call({
    int helmetPage = 1,
    int vestPage = 1,
    int glovesPage = 1,
    int glassesPage = 1,
    int maskPage = 1,
    int bootsPage = 1,
  }) {
    return PpeLogsProvider(
      helmetPage: helmetPage,
      vestPage: vestPage,
      glovesPage: glovesPage,
      glassesPage: glassesPage,
      maskPage: maskPage,
      bootsPage: bootsPage,
    );
  }

  @override
  PpeLogsProvider getProviderOverride(covariant PpeLogsProvider provider) {
    return call(
      helmetPage: provider.helmetPage,
      vestPage: provider.vestPage,
      glovesPage: provider.glovesPage,
      glassesPage: provider.glassesPage,
      maskPage: provider.maskPage,
      bootsPage: provider.bootsPage,
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
  String? get name => r'ppeLogsProvider';
}

/// See also [ppeLogs].
class PpeLogsProvider extends AutoDisposeFutureProvider<PpeLogResponse> {
  /// See also [ppeLogs].
  PpeLogsProvider({
    int helmetPage = 1,
    int vestPage = 1,
    int glovesPage = 1,
    int glassesPage = 1,
    int maskPage = 1,
    int bootsPage = 1,
  }) : this._internal(
         (ref) => ppeLogs(
           ref as PpeLogsRef,
           helmetPage: helmetPage,
           vestPage: vestPage,
           glovesPage: glovesPage,
           glassesPage: glassesPage,
           maskPage: maskPage,
           bootsPage: bootsPage,
         ),
         from: ppeLogsProvider,
         name: r'ppeLogsProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$ppeLogsHash,
         dependencies: PpeLogsFamily._dependencies,
         allTransitiveDependencies: PpeLogsFamily._allTransitiveDependencies,
         helmetPage: helmetPage,
         vestPage: vestPage,
         glovesPage: glovesPage,
         glassesPage: glassesPage,
         maskPage: maskPage,
         bootsPage: bootsPage,
       );

  PpeLogsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.helmetPage,
    required this.vestPage,
    required this.glovesPage,
    required this.glassesPage,
    required this.maskPage,
    required this.bootsPage,
  }) : super.internal();

  final int helmetPage;
  final int vestPage;
  final int glovesPage;
  final int glassesPage;
  final int maskPage;
  final int bootsPage;

  @override
  Override overrideWith(
    FutureOr<PpeLogResponse> Function(PpeLogsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PpeLogsProvider._internal(
        (ref) => create(ref as PpeLogsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        helmetPage: helmetPage,
        vestPage: vestPage,
        glovesPage: glovesPage,
        glassesPage: glassesPage,
        maskPage: maskPage,
        bootsPage: bootsPage,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PpeLogResponse> createElement() {
    return _PpeLogsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PpeLogsProvider &&
        other.helmetPage == helmetPage &&
        other.vestPage == vestPage &&
        other.glovesPage == glovesPage &&
        other.glassesPage == glassesPage &&
        other.maskPage == maskPage &&
        other.bootsPage == bootsPage;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, helmetPage.hashCode);
    hash = _SystemHash.combine(hash, vestPage.hashCode);
    hash = _SystemHash.combine(hash, glovesPage.hashCode);
    hash = _SystemHash.combine(hash, glassesPage.hashCode);
    hash = _SystemHash.combine(hash, maskPage.hashCode);
    hash = _SystemHash.combine(hash, bootsPage.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PpeLogsRef on AutoDisposeFutureProviderRef<PpeLogResponse> {
  /// The parameter `helmetPage` of this provider.
  int get helmetPage;

  /// The parameter `vestPage` of this provider.
  int get vestPage;

  /// The parameter `glovesPage` of this provider.
  int get glovesPage;

  /// The parameter `glassesPage` of this provider.
  int get glassesPage;

  /// The parameter `maskPage` of this provider.
  int get maskPage;

  /// The parameter `bootsPage` of this provider.
  int get bootsPage;
}

class _PpeLogsProviderElement
    extends AutoDisposeFutureProviderElement<PpeLogResponse>
    with PpeLogsRef {
  _PpeLogsProviderElement(super.provider);

  @override
  int get helmetPage => (origin as PpeLogsProvider).helmetPage;
  @override
  int get vestPage => (origin as PpeLogsProvider).vestPage;
  @override
  int get glovesPage => (origin as PpeLogsProvider).glovesPage;
  @override
  int get glassesPage => (origin as PpeLogsProvider).glassesPage;
  @override
  int get maskPage => (origin as PpeLogsProvider).maskPage;
  @override
  int get bootsPage => (origin as PpeLogsProvider).bootsPage;
}

String _$ppeLogDetailsHash() => r'4124368a32fff5674efafbf1a4bddaaa75ef1e41';

/// See also [ppeLogDetails].
@ProviderFor(ppeLogDetails)
const ppeLogDetailsProvider = PpeLogDetailsFamily();

/// See also [ppeLogDetails].
class PpeLogDetailsFamily extends Family<AsyncValue<PpeLogItem>> {
  /// See also [ppeLogDetails].
  const PpeLogDetailsFamily();

  /// See also [ppeLogDetails].
  PpeLogDetailsProvider call(int id) {
    return PpeLogDetailsProvider(id);
  }

  @override
  PpeLogDetailsProvider getProviderOverride(
    covariant PpeLogDetailsProvider provider,
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
  String? get name => r'ppeLogDetailsProvider';
}

/// See also [ppeLogDetails].
class PpeLogDetailsProvider extends AutoDisposeFutureProvider<PpeLogItem> {
  /// See also [ppeLogDetails].
  PpeLogDetailsProvider(int id)
    : this._internal(
        (ref) => ppeLogDetails(ref as PpeLogDetailsRef, id),
        from: ppeLogDetailsProvider,
        name: r'ppeLogDetailsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$ppeLogDetailsHash,
        dependencies: PpeLogDetailsFamily._dependencies,
        allTransitiveDependencies:
            PpeLogDetailsFamily._allTransitiveDependencies,
        id: id,
      );

  PpeLogDetailsProvider._internal(
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
    FutureOr<PpeLogItem> Function(PpeLogDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PpeLogDetailsProvider._internal(
        (ref) => create(ref as PpeLogDetailsRef),
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
  AutoDisposeFutureProviderElement<PpeLogItem> createElement() {
    return _PpeLogDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PpeLogDetailsProvider && other.id == id;
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
mixin PpeLogDetailsRef on AutoDisposeFutureProviderRef<PpeLogItem> {
  /// The parameter `id` of this provider.
  int get id;
}

class _PpeLogDetailsProviderElement
    extends AutoDisposeFutureProviderElement<PpeLogItem>
    with PpeLogDetailsRef {
  _PpeLogDetailsProviderElement(super.provider);

  @override
  int get id => (origin as PpeLogDetailsProvider).id;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
