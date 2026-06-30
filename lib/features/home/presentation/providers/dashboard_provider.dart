import 'package:titan/features/home/data/models/dashboard_response.dart';
import 'package:titan/features/home/data/repositories/dashboard_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dashboard_provider.g.dart';

@riverpod
Future<DashboardResponse> dashboard(DashboardRef ref) async {
  final repository = ref.watch(dashboardRepositoryProvider);
  return repository.fetchDashboardData();
}
