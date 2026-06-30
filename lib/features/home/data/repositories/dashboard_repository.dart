import 'package:dio/dio.dart';
import 'package:titan/core/network/dio_provider.dart';
import 'package:titan/core/constants/api_constants.dart';
import 'package:titan/features/home/data/models/dashboard_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dashboard_repository.g.dart';

@riverpod
DashboardRepository dashboardRepository(DashboardRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  return DashboardRepository(dio);
}

class DashboardRepository {
  final Dio _dio;

  DashboardRepository(this._dio);

  Future<DashboardResponse> fetchDashboardData() async {
    try {
      final response = await _dio.get(ApiConstants.dashboard);
      return DashboardResponse.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to fetch dashboard data: $e');
    }
  }
}
