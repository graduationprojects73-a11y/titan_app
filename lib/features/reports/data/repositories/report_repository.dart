import 'package:dio/dio.dart';
import 'package:titan/core/network/dio_provider.dart';
import 'package:titan/core/constants/api_constants.dart';
import 'package:titan/features/reports/data/models/report_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'report_repository.g.dart';

@riverpod
ReportRepository reportRepository(ReportRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  return ReportRepository(dio);
}

class ReportRepository {
  final Dio _dio;
  ReportResponse? _cachedResponse;

  ReportRepository(this._dio);

  Future<ReportResponse> fetchReports({bool forceRefresh = false}) async {
    if (!forceRefresh && _cachedResponse != null) {
      return _cachedResponse!;
    }
    try {
      final response = await _dio.get(ApiConstants.reports);
      final reportResponse = ReportResponse.fromJson(response.data);
      if (reportResponse.status == 'success') {
        _cachedResponse = reportResponse;
        return reportResponse;
      } else {
        throw Exception(reportResponse.message);
      }
    } catch (e) {
      throw Exception('Failed to fetch reports: $e');
    }
  }

  void clearCache() {
    _cachedResponse = null;
  }
}
