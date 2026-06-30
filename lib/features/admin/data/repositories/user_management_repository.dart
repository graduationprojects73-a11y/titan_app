import 'package:dio/dio.dart';
import 'package:titan/core/constants/api_constants.dart';
import 'package:titan/core/network/dio_provider.dart';
import 'package:titan/features/auth/data/models/user_model.dart';
import 'package:titan/features/admin/data/models/vehicles_response.dart';
import 'package:titan/features/monitoring/data/models/vehicle_log.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_management_repository.g.dart';

@riverpod
UserManagementRepository userManagementRepository(
  UserManagementRepositoryRef ref,
) {
  final dio = ref.watch(dioProvider);
  return UserManagementRepository(dio);
}

class UserManagementRepository {
  final Dio _dio;
  List<UserModel>? _cachedUsers;
  final Map<int, UserModel> _singleUserCache = {};
  List<Vehicle>? _cachedVehicles;
  List<Vehicle>? _cachedAuthorizedVehicles;
  List<Vehicle>? _cachedUnauthorizedVehicles;

  UserManagementRepository(this._dio);

  void _cacheUsersList(List<UserModel> users) {
    for (final user in users) {
      _singleUserCache[user.id] = user;
    }
  }

  Future<List<UserModel>> getUsers({bool forceRefresh = false}) async {
    if (!forceRefresh && _cachedUsers != null) {
      return _cachedUsers!;
    }
    try {
      final response = await _dio.get(ApiConstants.getUsers);
      final listResponse = UsersListResponse.fromJson(response.data);
      _cachedUsers = listResponse.users;
      _cacheUsersList(listResponse.users);
      return _cachedUsers!;
    } on DioException catch (e) {
      throw Exception(e.message ?? 'Failed to fetch users');
    }
  }

  void clearUsersCache() {
    _cachedUsers = null;
    _singleUserCache.clear();
  }

  UserModel _parseUser(Map<String, dynamic> data) {
    if (data.containsKey('user')) {
      return UserModel.fromJson(data['user'] as Map<String, dynamic>);
    }
    return UserModel.fromJson(data);
  }

  Future<UserModel> addUser({
    required String name,
    required String email,
    required String password,
    required String role,
  }) async {
    try {
      final response = await _dio.post(
        ApiConstants.addUser,
        data: {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation':
              password, // Usually needed in Laravel based APIs
          'role': role,
        },
      );

      final data = response.data['data'] as Map<String, dynamic>;
      final user = _parseUser(data);
      _singleUserCache[user.id] = user;
      return user;
    } on DioException catch (e) {
      final message = e.response?.data['message'] ?? 'Failed to add user';
      throw Exception(message);
    }
  }

  Future<UserModel> getUserDetails(int id, {bool forceRefresh = false}) async {
    if (!forceRefresh && _singleUserCache.containsKey(id)) {
      return _singleUserCache[id]!;
    }
    try {
      final response = await _dio.get('${ApiConstants.showUser}/$id');
      final data = response.data['data'] as Map<String, dynamic>;
      final user = _parseUser(data);
      _singleUserCache[id] = user;
      return user;
    } on DioException catch (e) {
      throw Exception(e.message ?? 'Failed to fetch user details');
    }
  }

  Future<UserModel> updateUser({
    required int id,
    required String name,
    required String email,
    required String role,
    String? password,
  }) async {
    try {
      final Map<String, dynamic> data = {
        'name': name,
        'email': email,
        'role': role,
      };
      if (password != null && password.isNotEmpty) {
        data['password'] = password;
        data['password_confirmation'] = password;
      }

      final response = await _dio.put(
        '${ApiConstants.updateUser}/$id',
        data: data,
      );
      final responseData = response.data['data'] as Map<String, dynamic>;
      final user = _parseUser(responseData);
      _singleUserCache[id] = user;
      return user;
    } on DioException catch (e) {
      final message = e.response?.data['message'] ?? 'Failed to update user';
      throw Exception(message);
    }
  }

  Future<void> deleteUser(int id) async {
    try {
      await _dio.delete('${ApiConstants.deleteUser}/$id');
      _singleUserCache.remove(id);
    } on DioException catch (e) {
      final message = e.response?.data['message'] ?? 'Failed to delete user';
      throw Exception(message);
    }
  }

  Future<List<Vehicle>> getVehicles({bool forceRefresh = false}) async {
    if (!forceRefresh && _cachedVehicles != null) {
      return _cachedVehicles!;
    }
    try {
      final response = await _dio.get(ApiConstants.allVehicles);
      final vehiclesResponse = VehiclesResponse.fromJson(response.data);
      _cachedVehicles = vehiclesResponse.data.data;
      return _cachedVehicles!;
    } on DioException catch (e) {
      throw Exception(e.message ?? 'Failed to fetch vehicles');
    }
  }

  Future<List<Vehicle>> getAuthorizedVehicles({bool forceRefresh = false}) async {
    if (!forceRefresh && _cachedAuthorizedVehicles != null) {
      return _cachedAuthorizedVehicles!;
    }
    try {
      final response = await _dio.get(ApiConstants.authorizedVehicles);
      final vehiclesResponse = VehiclesResponse.fromJson(response.data);
      _cachedAuthorizedVehicles = vehiclesResponse.data.data;
      return _cachedAuthorizedVehicles!;
    } on DioException catch (e) {
      throw Exception(e.message ?? 'Failed to fetch authorized vehicles');
    }
  }

  Future<List<Vehicle>> getUnauthorizedVehicles({bool forceRefresh = false}) async {
    if (!forceRefresh && _cachedUnauthorizedVehicles != null) {
      return _cachedUnauthorizedVehicles!;
    }
    try {
      final response = await _dio.get(ApiConstants.unauthorizedVehicles);
      final vehiclesResponse = VehiclesResponse.fromJson(response.data);
      _cachedUnauthorizedVehicles = vehiclesResponse.data.data;
      return _cachedUnauthorizedVehicles!;
    } on DioException catch (e) {
      throw Exception(e.message ?? 'Failed to fetch unauthorized vehicles');
    }
  }

  void clearVehiclesCache() {
    _cachedVehicles = null;
    _cachedAuthorizedVehicles = null;
    _cachedUnauthorizedVehicles = null;
  }

  Future<Vehicle> addVehicle({
    required String licensePlate,
    required String vehicleType,
    required int authorized,
    required String imagePath,
    required int numberCamera,
  }) async {
    try {
      final formData = FormData.fromMap({
        'license_plate': licensePlate,
        'vehicle_type': vehicleType,
        'authorized': authorized,
        'number_camera': numberCamera,
        'image': await MultipartFile.fromFile(imagePath),
      });

      final response = await _dio.post(
        ApiConstants.createVehicle,
        data: formData,
      );

      final responseData = response.data['data'];
      return Vehicle.fromJson(responseData);
    } on DioException catch (e) {
      final message =
          e.response?.data['message'] ?? e.message ?? 'Failed to add vehicle';
      throw Exception(message);
    }
  }

  Future<Vehicle> updateVehicle({
    required int id,
    required String licensePlate,
    required String vehicleType,
    required int authorized,
    required int numberCamera,
    String? imagePath,
  }) async {
    try {
      final Map<String, dynamic> dataMap = {
        'license_plate': licensePlate,
        'vehicle_type': vehicleType,
        'authorized': authorized,
        'number_camera': numberCamera,
        '_method': 'PUT', // Laravel often needs this for FormData PUT requests
      };

      if (imagePath != null) {
        dataMap['image'] = await MultipartFile.fromFile(imagePath);
      }

      final formData = FormData.fromMap(dataMap);

      final response = await _dio.post(
        '${ApiConstants.updateVehicle}/$id',
        data: formData,
      );

      final responseData = response.data['data'];
      return Vehicle.fromJson(responseData);
    } on DioException catch (e) {
      final message =
          e.response?.data['message'] ??
          e.message ??
          'Failed to update vehicle';
      throw Exception(message);
    }
  }

  Future<void> deleteVehicle(int id) async {
    try {
      await _dio.delete('${ApiConstants.deleteVehicle}/$id');
    } on DioException catch (e) {
      final message =
          e.response?.data['message'] ??
          e.message ??
          'Failed to delete vehicle';
      throw Exception(message);
    }
  }
}
