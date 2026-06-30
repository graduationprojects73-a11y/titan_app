import 'package:titan/features/monitoring/data/models/ppe_log_response.dart';
import 'package:titan/features/monitoring/data/repositories/ppe_log_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ppe_log_provider.g.dart';

@riverpod
Future<PpeLogResponse> ppeLogs(
  PpeLogsRef ref, {
  int helmetPage = 1,
  int vestPage = 1,
  int glovesPage = 1,
  int glassesPage = 1,
  int maskPage = 1,
  int bootsPage = 1,
}) async {
  final repository = ref.watch(ppeLogRepositoryProvider);
  return repository.fetchPpeLogs(
    helmetPage: helmetPage,
    vestPage: vestPage,
    glovesPage: glovesPage,
    glassesPage: glassesPage,
    maskPage: maskPage,
    bootsPage: bootsPage,
  );
}

@riverpod
Future<PpeLogItem> ppeLogDetails(PpeLogDetailsRef ref, int id) async {
  final repository = ref.watch(ppeLogRepositoryProvider);
  return repository.fetchPpeLogById(id);
}
