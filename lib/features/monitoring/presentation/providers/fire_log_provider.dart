import 'package:titan/features/monitoring/data/models/fire_log_response.dart';
import 'package:titan/features/monitoring/data/repositories/fire_log_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fire_log_provider.g.dart';

@riverpod
Future<List<FireLogDetail>> fireLogs(FireLogsRef ref) async {
  final repo = ref.watch(fireLogRepositoryProvider);
  return repo.getFireLogs();
}

@riverpod
Future<FireLogDetail> fireLogDetails(FireLogDetailsRef ref, int id) async {
  final repo = ref.watch(fireLogRepositoryProvider);
  return repo.getFireLogDetails(id);
}
