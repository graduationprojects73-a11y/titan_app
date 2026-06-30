// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_management_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$usersListHash() => r'9597c07f0d85b35d79ae3ae1196024cde76d7f66';

/// See also [usersList].
@ProviderFor(usersList)
final usersListProvider = AutoDisposeFutureProvider<List<UserModel>>.internal(
  usersList,
  name: r'usersListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$usersListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UsersListRef = AutoDisposeFutureProviderRef<List<UserModel>>;
String _$userDetailsHash() => r'33c5c3b04fe41ded176dd0ba1d196122f91d97fc';

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

/// See also [userDetails].
@ProviderFor(userDetails)
const userDetailsProvider = UserDetailsFamily();

/// See also [userDetails].
class UserDetailsFamily extends Family<AsyncValue<UserModel>> {
  /// See also [userDetails].
  const UserDetailsFamily();

  /// See also [userDetails].
  UserDetailsProvider call(int id) {
    return UserDetailsProvider(id);
  }

  @override
  UserDetailsProvider getProviderOverride(
    covariant UserDetailsProvider provider,
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
  String? get name => r'userDetailsProvider';
}

/// See also [userDetails].
class UserDetailsProvider extends AutoDisposeFutureProvider<UserModel> {
  /// See also [userDetails].
  UserDetailsProvider(int id)
    : this._internal(
        (ref) => userDetails(ref as UserDetailsRef, id),
        from: userDetailsProvider,
        name: r'userDetailsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$userDetailsHash,
        dependencies: UserDetailsFamily._dependencies,
        allTransitiveDependencies: UserDetailsFamily._allTransitiveDependencies,
        id: id,
      );

  UserDetailsProvider._internal(
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
    FutureOr<UserModel> Function(UserDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserDetailsProvider._internal(
        (ref) => create(ref as UserDetailsRef),
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
  AutoDisposeFutureProviderElement<UserModel> createElement() {
    return _UserDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserDetailsProvider && other.id == id;
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
mixin UserDetailsRef on AutoDisposeFutureProviderRef<UserModel> {
  /// The parameter `id` of this provider.
  int get id;
}

class _UserDetailsProviderElement
    extends AutoDisposeFutureProviderElement<UserModel>
    with UserDetailsRef {
  _UserDetailsProviderElement(super.provider);

  @override
  int get id => (origin as UserDetailsProvider).id;
}

String _$vehiclesListHash() => r'5a79d3a370ce6a139d46d5477fc5dc5fcf6e85c7';

/// See also [vehiclesList].
@ProviderFor(vehiclesList)
final vehiclesListProvider = AutoDisposeFutureProvider<List<Vehicle>>.internal(
  vehiclesList,
  name: r'vehiclesListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$vehiclesListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef VehiclesListRef = AutoDisposeFutureProviderRef<List<Vehicle>>;
String _$authorizedVehiclesListHash() =>
    r'90998e68cb7da1a60383b1d901c231b281fee243';

/// See also [authorizedVehiclesList].
@ProviderFor(authorizedVehiclesList)
final authorizedVehiclesListProvider =
    AutoDisposeFutureProvider<List<Vehicle>>.internal(
      authorizedVehiclesList,
      name: r'authorizedVehiclesListProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$authorizedVehiclesListHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthorizedVehiclesListRef = AutoDisposeFutureProviderRef<List<Vehicle>>;
String _$unauthorizedVehiclesListHash() =>
    r'77bbdaba2c0519e63eb4ba906a9a7767b773d223';

/// See also [unauthorizedVehiclesList].
@ProviderFor(unauthorizedVehiclesList)
final unauthorizedVehiclesListProvider =
    AutoDisposeFutureProvider<List<Vehicle>>.internal(
      unauthorizedVehiclesList,
      name: r'unauthorizedVehiclesListProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$unauthorizedVehiclesListHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UnauthorizedVehiclesListRef =
    AutoDisposeFutureProviderRef<List<Vehicle>>;
String _$addUserNotifierHash() => r'6c11e203122eaea952c02d259290b2ae3534b292';

/// See also [AddUserNotifier].
@ProviderFor(AddUserNotifier)
final addUserNotifierProvider =
    AutoDisposeNotifierProvider<
      AddUserNotifier,
      AsyncValue<UserModel?>
    >.internal(
      AddUserNotifier.new,
      name: r'addUserNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$addUserNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AddUserNotifier = AutoDisposeNotifier<AsyncValue<UserModel?>>;
String _$updateUserNotifierHash() =>
    r'd79cc3d0ef30c3799ec1951dfb33c70f7b67970f';

/// See also [UpdateUserNotifier].
@ProviderFor(UpdateUserNotifier)
final updateUserNotifierProvider =
    AutoDisposeNotifierProvider<
      UpdateUserNotifier,
      AsyncValue<UserModel?>
    >.internal(
      UpdateUserNotifier.new,
      name: r'updateUserNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$updateUserNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$UpdateUserNotifier = AutoDisposeNotifier<AsyncValue<UserModel?>>;
String _$deleteUserNotifierHash() =>
    r'045541f40f6600d73ae5f9df526b4f0fc39b7484';

/// See also [DeleteUserNotifier].
@ProviderFor(DeleteUserNotifier)
final deleteUserNotifierProvider =
    AutoDisposeNotifierProvider<DeleteUserNotifier, AsyncValue<void>>.internal(
      DeleteUserNotifier.new,
      name: r'deleteUserNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$deleteUserNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$DeleteUserNotifier = AutoDisposeNotifier<AsyncValue<void>>;
String _$addVehicleNotifierHash() =>
    r'e6a993aed515e0efb91bb911f7ff429312cdabd4';

/// See also [AddVehicleNotifier].
@ProviderFor(AddVehicleNotifier)
final addVehicleNotifierProvider =
    AutoDisposeNotifierProvider<
      AddVehicleNotifier,
      AsyncValue<Vehicle?>
    >.internal(
      AddVehicleNotifier.new,
      name: r'addVehicleNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$addVehicleNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AddVehicleNotifier = AutoDisposeNotifier<AsyncValue<Vehicle?>>;
String _$updateVehicleNotifierHash() =>
    r'52db7add65c7d6ccc7ae86d45ab4b6beacb3c593';

/// See also [UpdateVehicleNotifier].
@ProviderFor(UpdateVehicleNotifier)
final updateVehicleNotifierProvider =
    AutoDisposeNotifierProvider<
      UpdateVehicleNotifier,
      AsyncValue<Vehicle?>
    >.internal(
      UpdateVehicleNotifier.new,
      name: r'updateVehicleNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$updateVehicleNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$UpdateVehicleNotifier = AutoDisposeNotifier<AsyncValue<Vehicle?>>;
String _$deleteVehicleNotifierHash() =>
    r'f690d0be84163cf9c7c434a90e983c84eb036bf4';

/// See also [DeleteVehicleNotifier].
@ProviderFor(DeleteVehicleNotifier)
final deleteVehicleNotifierProvider =
    AutoDisposeNotifierProvider<
      DeleteVehicleNotifier,
      AsyncValue<void>
    >.internal(
      DeleteVehicleNotifier.new,
      name: r'deleteVehicleNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$deleteVehicleNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$DeleteVehicleNotifier = AutoDisposeNotifier<AsyncValue<void>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
