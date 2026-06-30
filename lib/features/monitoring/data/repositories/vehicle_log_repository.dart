import 'package:dio/dio.dart';
import 'package:titan/core/network/dio_provider.dart';
import 'package:titan/core/constants/api_constants.dart';
import 'package:titan/features/monitoring/data/models/vehicle_log.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'vehicle_log_repository.g.dart';

@riverpod
VehicleLogRepository vehicleLogRepository(VehicleLogRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  return VehicleLogRepository(dio);
}

class VehicleLogRepository {
  final Dio _dio;
  final Map<int, VehicleLog> _cache = {};

  VehicleLogRepository(this._dio);

  Future<List<VehicleLog>> fetchVehicleLogs() async {
    try {
      final response = await _dio.get(
        ApiConstants.vehicleLogs,
      );
      final vehicleLogResponse = VehicleLogResponse.fromJson(response.data);
      if (vehicleLogResponse.status == 'success') {
        final logs = vehicleLogResponse.data.data;
        for (final log in logs) {
          _cache[log.id] = log;
        }
        return logs;
      } else {
        throw Exception(vehicleLogResponse.message);
      }
    } catch (e) {
      throw Exception('Failed to fetch vehicle logs: $e');
    }
  }

  Future<VehicleLog> fetchVehicleLogById(int id, {bool forceRefresh = false}) async {
    if (!forceRefresh && _cache.containsKey(id)) {
      return _cache[id]!;
    }

    try {
      final response = await _dio.get(
        '${ApiConstants.vehicleLogDetails}/$id',
      );
      final singleResponse = SingleVehicleLogResponse.fromJson(response.data);
      if (singleResponse.status == 'success') {
        final log = singleResponse.data;
        _cache[log.id] = log;
        return log;
      } else {
        throw Exception(singleResponse.message);
      }
    } catch (e) {
      throw Exception('Failed to fetch vehicle log details: $e');
    }
  }
}
