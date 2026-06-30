// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_log_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$vehicleLogsHash() => r'a0dae448998c8e4794f207a27f68c5d6940b45ba';

/// See also [vehicleLogs].
@ProviderFor(vehicleLogs)
final vehicleLogsProvider =
    AutoDisposeFutureProvider<List<VehicleLog>>.internal(
      vehicleLogs,
      name: r'vehicleLogsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$vehicleLogsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef VehicleLogsRef = AutoDisposeFutureProviderRef<List<VehicleLog>>;
String _$vehicleLogDetailsHash() => r'ea8dd58d128011f12b7849a7a923af7f80639e7d';

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

/// See also [vehicleLogDetails].
@ProviderFor(vehicleLogDetails)
const vehicleLogDetailsProvider = VehicleLogDetailsFamily();

/// See also [vehicleLogDetails].
class VehicleLogDetailsFamily extends Family<AsyncValue<VehicleLog>> {
  /// See also [vehicleLogDetails].
  const VehicleLogDetailsFamily();

  /// See also [vehicleLogDetails].
  VehicleLogDetailsProvider call(int id) {
    return VehicleLogDetailsProvider(id);
  }

  @override
  VehicleLogDetailsProvider getProviderOverride(
    covariant VehicleLogDetailsProvider provider,
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
  String? get name => r'vehicleLogDetailsProvider';
}

/// See also [vehicleLogDetails].
class VehicleLogDetailsProvider extends AutoDisposeFutureProvider<VehicleLog> {
  /// See also [vehicleLogDetails].
  VehicleLogDetailsProvider(int id)
    : this._internal(
        (ref) => vehicleLogDetails(ref as VehicleLogDetailsRef, id),
        from: vehicleLogDetailsProvider,
        name: r'vehicleLogDetailsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$vehicleLogDetailsHash,
        dependencies: VehicleLogDetailsFamily._dependencies,
        allTransitiveDependencies:
            VehicleLogDetailsFamily._allTransitiveDependencies,
        id: id,
      );

  VehicleLogDetailsProvider._internal(
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
    FutureOr<VehicleLog> Function(VehicleLogDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VehicleLogDetailsProvider._internal(
        (ref) => create(ref as VehicleLogDetailsRef),
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
  AutoDisposeFutureProviderElement<VehicleLog> createElement() {
    return _VehicleLogDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VehicleLogDetailsProvider && other.id == id;
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
mixin VehicleLogDetailsRef on AutoDisposeFutureProviderRef<VehicleLog> {
  /// The parameter `id` of this provider.
  int get id;
}

class _VehicleLogDetailsProviderElement
    extends AutoDisposeFutureProviderElement<VehicleLog>
    with VehicleLogDetailsRef {
  _VehicleLogDetailsProviderElement(super.provider);

  @override
  int get id => (origin as VehicleLogDetailsProvider).id;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
