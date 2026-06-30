import 'package:titan/features/admin/data/repositories/user_management_repository.dart';
import 'package:titan/features/auth/data/models/user_model.dart';
import 'package:titan/features/monitoring/data/models/vehicle_log.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_management_provider.g.dart';

@riverpod
Future<List<UserModel>> usersList(UsersListRef ref) async {
  final repo = ref.watch(userManagementRepositoryProvider);
  return repo.getUsers();
}

@riverpod
class AddUserNotifier extends _$AddUserNotifier {
  @override
  AsyncValue<UserModel?> build() => const AsyncValue.data(null);

  Future<bool> addUser({
    required String name,
    required String email,
    required String password,
    required String role,
  }) async {
    state = const AsyncValue.loading();
    try {
      final repo = ref.read(userManagementRepositoryProvider);
      final user = await repo.addUser(
        name: name,
        email: email,
        password: password,
        role: role,
      );
      state = AsyncValue.data(user);
      // Refresh the list after adding a new user
      repo.clearUsersCache();
      ref.invalidate(usersListProvider);
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }
}

@riverpod
Future<UserModel> userDetails(UserDetailsRef ref, int id) async {
  final repo = ref.watch(userManagementRepositoryProvider);
  return repo.getUserDetails(id);
}

@riverpod
class UpdateUserNotifier extends _$UpdateUserNotifier {
  @override
  AsyncValue<UserModel?> build() => const AsyncValue.data(null);

  Future<bool> updateUser({
    required int id,
    required String name,
    required String email,
    required String role,
    String? password,
  }) async {
    state = const AsyncValue.loading();
    try {
      final repo = ref.read(userManagementRepositoryProvider);
      final user = await repo.updateUser(
        id: id,
        name: name,
        email: email,
        password: password,
        role: role,
      );
      state = AsyncValue.data(user);
      // Invalidate related providers
      repo.clearUsersCache();
      ref.invalidate(usersListProvider);
      ref.invalidate(userDetailsProvider(id));
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }
}

@riverpod
class DeleteUserNotifier extends _$DeleteUserNotifier {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<bool> deleteUser(int id) async {
    state = const AsyncValue.loading();
    try {
      final repo = ref.read(userManagementRepositoryProvider);
      await repo.deleteUser(id);
      state = const AsyncValue.data(null);
      // Invalidate the list to refresh it
      repo.clearUsersCache();
      ref.invalidate(usersListProvider);
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }
}

@riverpod
class AddVehicleNotifier extends _$AddVehicleNotifier {
  @override
  AsyncValue<Vehicle?> build() => const AsyncValue.data(null);

  Future<bool> addVehicle({
    required String licensePlate,
    required String vehicleType,
    required int authorized,
    required String imagePath,
    required int numberCamera,
  }) async {
    state = const AsyncValue.loading();
    try {
      final repo = ref.read(userManagementRepositoryProvider);
      final vehicle = await repo.addVehicle(
        licensePlate: licensePlate,
        vehicleType: vehicleType,
        authorized: authorized,
        imagePath: imagePath,
        numberCamera: numberCamera,
      );
      state = AsyncValue.data(vehicle);
      repo.clearVehiclesCache();
      ref.invalidate(vehiclesListProvider);
      ref.invalidate(authorizedVehiclesListProvider);
      ref.invalidate(unauthorizedVehiclesListProvider);
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }
}

@riverpod
class UpdateVehicleNotifier extends _$UpdateVehicleNotifier {
  @override
  AsyncValue<Vehicle?> build() => const AsyncValue.data(null);

  Future<bool> updateVehicle({
    required int id,
    required String licensePlate,
    required String vehicleType,
    required int authorized,
    required int numberCamera,
    String? imagePath,
  }) async {
    state = const AsyncValue.loading();
    try {
      final repo = ref.read(userManagementRepositoryProvider);
      final vehicle = await repo.updateVehicle(
        id: id,
        licensePlate: licensePlate,
        vehicleType: vehicleType,
        authorized: authorized,
        numberCamera: numberCamera,
        imagePath: imagePath,
      );
      state = AsyncValue.data(vehicle);
      repo.clearVehiclesCache();
      ref.invalidate(vehiclesListProvider);
      ref.invalidate(authorizedVehiclesListProvider);
      ref.invalidate(unauthorizedVehiclesListProvider);
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }
}

@riverpod
class DeleteVehicleNotifier extends _$DeleteVehicleNotifier {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<bool> deleteVehicle(int id) async {
    state = const AsyncValue.loading();
    try {
      final repo = ref.read(userManagementRepositoryProvider);
      await repo.deleteVehicle(id);
      state = const AsyncValue.data(null);
      repo.clearVehiclesCache();
      ref.invalidate(vehiclesListProvider);
      ref.invalidate(authorizedVehiclesListProvider);
      ref.invalidate(unauthorizedVehiclesListProvider);
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }
}

@riverpod
Future<List<Vehicle>> vehiclesList(VehiclesListRef ref) async {
  final repo = ref.watch(userManagementRepositoryProvider);
  return repo.getVehicles();
}

@riverpod
Future<List<Vehicle>> authorizedVehiclesList(AuthorizedVehiclesListRef ref) async {
  final repo = ref.watch(userManagementRepositoryProvider);
  return repo.getAuthorizedVehicles();
}

@riverpod
Future<List<Vehicle>> unauthorizedVehiclesList(UnauthorizedVehiclesListRef ref) async {
  final repo = ref.watch(userManagementRepositoryProvider);
  return repo.getUnauthorizedVehicles();
}
