// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_log.freezed.dart';
part 'vehicle_log.g.dart';

@freezed
abstract class VehicleLogResponse with _$VehicleLogResponse {
  const factory VehicleLogResponse({
    required String status,
    required String message,
    required VehicleLogPaginationData data,
  }) = _VehicleLogResponse;

  factory VehicleLogResponse.fromJson(Map<String, dynamic> json) =>
      _$VehicleLogResponseFromJson(json);
}

@freezed
abstract class SingleVehicleLogResponse with _$SingleVehicleLogResponse {
  const factory SingleVehicleLogResponse({
    required String status,
    required String message,
    required VehicleLog data,
  }) = _SingleVehicleLogResponse;

  factory SingleVehicleLogResponse.fromJson(Map<String, dynamic> json) =>
      _$SingleVehicleLogResponseFromJson(json);
}

@freezed
abstract class VehicleLogPaginationData with _$VehicleLogPaginationData {
  const factory VehicleLogPaginationData({
    @JsonKey(name: 'current_page') required int currentPage,
    required List<VehicleLog> data,
    @JsonKey(name: 'first_page_url') required String firstPageUrl,
    required int from,
    @JsonKey(name: 'last_page') required int lastPage,
    @JsonKey(name: 'last_page_url') required String lastPageUrl,
    @JsonKey(name: 'next_page_url') String? nextPageUrl,
    required String path,
    @JsonKey(name: 'per_page') required int perPage,
    @JsonKey(name: 'prev_page_url') String? prevPageUrl,
    required int to,
    required int total,
  }) = _VehicleLogPaginationData;

  factory VehicleLogPaginationData.fromJson(Map<String, dynamic> json) =>
      _$VehicleLogPaginationDataFromJson(json);
}


@freezed
abstract class VehicleLog with _$VehicleLog {
  const factory VehicleLog({
    required int id,
    @JsonKey(name: 'license_plate') required String licensePlate,
    required String image,
    required int authorized,
    @JsonKey(name: 'vehicle_id') required int vehicleId,
    @JsonKey(name: 'camera_id') required int cameraId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    required Camera? camera,
    required Vehicle? vehicle,
  }) = _VehicleLog;

  factory VehicleLog.fromJson(Map<String, dynamic> json) =>
      _$VehicleLogFromJson(json);
}

@freezed
abstract class Camera with _$Camera {
  const factory Camera({
    required int id,
    @JsonKey(name: 'number_camera') required int numberCamera,
    @JsonKey(name: 'user_id') required int userId,
    required String location,
    required String status,
    @JsonKey(name: 'installation_date') required String installationDate,
    required String department,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Camera;

  factory Camera.fromJson(Map<String, dynamic> json) => _$CameraFromJson(json);
}

@freezed
abstract class Vehicle with _$Vehicle {
  const factory Vehicle({
    required int id,
    @JsonKey(name: 'license_plate') required String licensePlate,
    required int authorized,
    @JsonKey(name: 'vehicle_type') required String vehicleType,
    required String image,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Vehicle;

  factory Vehicle.fromJson(Map<String, dynamic> json) =>
      _$VehicleFromJson(json);
}
