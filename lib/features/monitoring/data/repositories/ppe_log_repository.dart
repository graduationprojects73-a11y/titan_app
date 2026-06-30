import 'package:dio/dio.dart';
import 'package:titan/core/network/dio_provider.dart';
import 'package:titan/core/constants/api_constants.dart';
import 'package:titan/features/monitoring/data/models/ppe_log_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ppe_log_repository.g.dart';

@riverpod
PpeLogRepository ppeLogRepository(PpeLogRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  return PpeLogRepository(dio);
}

class PpeLogRepository {
  final Dio _dio;
  final Map<String, PpeLogResponse> _cache = {};
  final Map<int, PpeLogItem> _singleCache = {};

  PpeLogRepository(this._dio);

  String _buildCacheKey({
    int helmetPage = 1,
    int vestPage = 1,
    int glovesPage = 1,
    int glassesPage = 1,
    int maskPage = 1,
    int bootsPage = 1,
  }) {
    return 'h_$helmetPage-v_$vestPage-gl_$glovesPage-gs_$glassesPage-m_$maskPage-b_$bootsPage';
  }

  void _cacheSingleLogs(List<PpeLogItem> items) {
    for (final item in items) {
      if (item.id != null) {
        _singleCache[item.id!] = item;
      }
    }
  }

  Future<PpeLogResponse> fetchPpeLogs({
    int helmetPage = 1,
    int vestPage = 1,
    int glovesPage = 1,
    int glassesPage = 1,
    int maskPage = 1,
    int bootsPage = 1,
    bool forceRefresh = false,
  }) async {
    final cacheKey = _buildCacheKey(
      helmetPage: helmetPage,
      vestPage: vestPage,
      glovesPage: glovesPage,
      glassesPage: glassesPage,
      maskPage: maskPage,
      bootsPage: bootsPage,
    );

    if (!forceRefresh && _cache.containsKey(cacheKey)) {
      return _cache[cacheKey]!;
    }

    try {
      final response = await _dio.get(
        ApiConstants.ppeLogs,
        queryParameters: {
          if (helmetPage > 1) 'helmet_page': helmetPage,
          if (vestPage > 1) 'vest_page': vestPage,
          if (glovesPage > 1) 'gloves_page': glovesPage,
          if (glassesPage > 1) 'glasses_page': glassesPage,
          if (maskPage > 1) 'mask_page': maskPage,
          if (bootsPage > 1) 'boots_page': bootsPage,
        },
      );
      final ppeLogResponse = PpeLogResponse.fromJson(response.data);
      if (ppeLogResponse.status == 'success') {
        _cache[cacheKey] = ppeLogResponse;
        
        // Cache individual items for details view
        final data = ppeLogResponse.data;
        _cacheSingleLogs(data.helmet.data);
        _cacheSingleLogs(data.vest.data);
        _cacheSingleLogs(data.gloves.data);
        _cacheSingleLogs(data.glasses.data);
        _cacheSingleLogs(data.mask.data);
        _cacheSingleLogs(data.boots.data);

        return ppeLogResponse;
      } else {
        throw Exception(ppeLogResponse.message);
      }
    } catch (e) {
      throw Exception('Failed to fetch PPE logs: $e');
    }
  }

  Future<PpeLogItem> fetchPpeLogById(int id, {bool forceRefresh = false}) async {
    if (!forceRefresh && _singleCache.containsKey(id)) {
      return _singleCache[id]!;
    }

    try {
      final response = await _dio.get(
        '${ApiConstants.ppeLogDetails}/$id',
      );
      final singleResponse = SinglePpeLogResponse.fromJson(response.data);
      if (singleResponse.status == 'success') {
        final logItem = singleResponse.data;
        _singleCache[id] = logItem;
        return logItem;
      } else {
        throw Exception(singleResponse.message);
      }
    } catch (e) {
      throw Exception('Failed to fetch PPE log details: $e');
    }
  }

  void clearCache() {
    _cache.clear();
    _singleCache.clear();
  }
}
