import 'package:dio/dio.dart';
import 'package:titan/core/constants/api_constants.dart';
import 'package:titan/core/network/dio_provider.dart';
import 'package:titan/features/monitoring/data/models/fire_log_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fire_log_repository.g.dart';

@riverpod
FireLogRepository fireLogRepository(FireLogRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  return FireLogRepository(dio);
}

class FireLogRepository {
  final Dio _dio;
  List<FireLogDetail>? _cachedFireLogs;
  final Map<int, FireLogDetail> _singleFireLogCache = {};

  FireLogRepository(this._dio);

  /// Fetch all fire logs with local caching
  Future<List<FireLogDetail>> getFireLogs({bool forceRefresh = false}) async {
    if (!forceRefresh && _cachedFireLogs != null) {
      return _cachedFireLogs!;
    }
    try {
      final response = await _dio.get(ApiConstants.fireLogs);
      final logsResponse = FireLogsResponse.fromJson(response.data);
      _cachedFireLogs = logsResponse.data.data;
      
      // Cache individual logs too
      for (final log in _cachedFireLogs!) {
        _singleFireLogCache[log.id] = log;
      }
      
      return _cachedFireLogs!;
    } on DioException catch (e) {
      final message = e.response?.data['message'] ?? e.message ?? 'Failed to fetch fire logs';
      throw Exception(message);
    }
  }

  /// Fetch individual fire log details with local caching
  Future<FireLogDetail> getFireLogDetails(int id, {bool forceRefresh = false}) async {
    if (!forceRefresh && _singleFireLogCache.containsKey(id)) {
      return _singleFireLogCache[id]!;
    }
    try {
      final response = await _dio.get('${ApiConstants.fireLogDetails}/$id');
      final logResponse = SingleFireLogResponse.fromJson(response.data);
      final logDetail = logResponse.data;
      
      _singleFireLogCache[id] = logDetail;
      return logDetail;
    } on DioException catch (e) {
      final message = e.response?.data['message'] ?? e.message ?? 'Failed to fetch fire log details';
      throw Exception(message);
    }
  }

  /// Clear the local caches
  void clearFireLogsCache() {
    _cachedFireLogs = null;
    _singleFireLogCache.clear();
  }
}
