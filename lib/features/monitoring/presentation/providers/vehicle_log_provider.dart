import 'package:titan/features/monitoring/data/models/vehicle_log.dart';
import 'package:titan/features/monitoring/data/repositories/vehicle_log_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'vehicle_log_provider.g.dart';

@riverpod
Future<List<VehicleLog>> vehicleLogs(VehicleLogsRef ref) async {
  final repository = ref.watch(vehicleLogRepositoryProvider);
  return repository.fetchVehicleLogs();
}

@riverpod
Future<VehicleLog> vehicleLogDetails(VehicleLogDetailsRef ref, int id) async {
  final repository = ref.watch(vehicleLogRepositoryProvider);
  return repository.fetchVehicleLogById(id);
}
