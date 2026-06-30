import 'package:titan/features/reports/data/models/report_response.dart';
import 'package:titan/features/reports/data/repositories/report_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'report_provider.g.dart';

@riverpod
Future<ReportResponse> report(ReportRef ref) async {
  final repository = ref.watch(reportRepositoryProvider);
  return repository.fetchReports();
}
