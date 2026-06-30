import 'package:json_annotation/json_annotation.dart';

part 'dashboard_response.g.dart';

@JsonSerializable()
class DashboardResponse {
  final String status;
  final String message;
  final DashboardData data;

  DashboardResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory DashboardResponse.fromJson(Map<String, dynamic> json) =>
      _$DashboardResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardResponseToJson(this);
}

@JsonSerializable()
class DashboardData {
  @JsonKey(name: 'today_accident_count')
  final int todayAccidentCount;

  @JsonKey(name: 'safety_compliance')
  final dynamic safetyCompliance;

  @JsonKey(name: 'area_with_most_violations')
  final AreaWithMostViolations? areaWithMostViolations;

  @JsonKey(name: 'real_time_alerts')
  final RealTimeAlerts realTimeAlerts;

  DashboardData({
    required this.todayAccidentCount,
    required this.safetyCompliance,
    this.areaWithMostViolations,
    required this.realTimeAlerts,
  });

  factory DashboardData.fromJson(Map<String, dynamic> json) =>
      _$DashboardDataFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardDataToJson(this);
}

@JsonSerializable()
class AreaWithMostViolations {
  final String title;
  final String? area;
  final int total;

  AreaWithMostViolations({required this.title, this.area, required this.total});

  factory AreaWithMostViolations.fromJson(Map<String, dynamic> json) =>
      _$AreaWithMostViolationsFromJson(json);

  Map<String, dynamic> toJson() => _$AreaWithMostViolationsToJson(this);
}

@JsonSerializable()
class RealTimeAlerts {
  final String title;
  @JsonKey(name: 'ppe_log')
  final List<PpeLog>? ppeLog;
  @JsonKey(name: 'vehicle_log')
  final List<VehicleLog>? vehicleLog;
  @JsonKey(name: 'speed_log')
  final List<SpeedLog>? speedLog;
  @JsonKey(name: 'fire_log')
  final List<FireLog>? fireLog;
  @JsonKey(name: 'area_log')
  final dynamic areaLog;

  RealTimeAlerts({
    required this.title,
    this.ppeLog,
    this.vehicleLog,
    this.speedLog,
    this.fireLog,
    this.areaLog,
  });

  factory RealTimeAlerts.fromJson(Map<String, dynamic> json) =>
      _$RealTimeAlertsFromJson(json);

  Map<String, dynamic> toJson() => _$RealTimeAlertsToJson(this);
}

@JsonSerializable()
class PpeLog {
  final int id;
  final String image;
  @JsonKey(name: 'ppe_id')
  final int ppeId;
  @JsonKey(name: 'camera_id')
  final int cameraId;
  @JsonKey(name: 'worker_id')
  final int workerId;
  @JsonKey(name: 'created_at')
  final String createdAt;
  final Worker? worker;
  final Ppe? pees;

  PpeLog({
    required this.id,
    required this.image,
    required this.ppeId,
    required this.cameraId,
    required this.workerId,
    required this.createdAt,
    this.worker,
    this.pees,
  });

  factory PpeLog.fromJson(Map<String, dynamic> json) => _$PpeLogFromJson(json);

  Map<String, dynamic> toJson() => _$PpeLogToJson(this);
}

@JsonSerializable()
class Worker {
  final int id;
  final String name;
  final String? phone;
  final String? position;
  final String? department;
  final String? image;

  Worker({
    required this.id,
    required this.name,
    this.phone,
    this.position,
    this.department,
    this.image,
  });

  factory Worker.fromJson(Map<String, dynamic> json) => _$WorkerFromJson(json);

  Map<String, dynamic> toJson() => _$WorkerToJson(this);
}

@JsonSerializable()
class Ppe {
  final int id;
  @JsonKey(name: 'ppe_type')
  final String ppeType;
  final String description;

  Ppe({required this.id, required this.ppeType, required this.description});

  factory Ppe.fromJson(Map<String, dynamic> json) => _$PpeFromJson(json);

  Map<String, dynamic> toJson() => _$PpeToJson(this);
}

@JsonSerializable()
class VehicleLog {
  final int id;
  @JsonKey(name: 'license_plate')
  final String licensePlate;
  final String image;
  final int authorized;
  @JsonKey(name: 'vehicle_id')
  final int vehicleId;
  @JsonKey(name: 'camera_id')
  final int cameraId;
  @JsonKey(name: 'created_at')
  final String createdAt;
  final Vehicle? vehicle;
  final Camera? camera;

  VehicleLog({
    required this.id,
    required this.licensePlate,
    required this.image,
    required this.authorized,
    required this.vehicleId,
    required this.cameraId,
    required this.createdAt,
    this.vehicle,
    this.camera,
  });

  factory VehicleLog.fromJson(Map<String, dynamic> json) =>
      _$VehicleLogFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleLogToJson(this);
}

@JsonSerializable()
class Vehicle {
  final int id;
  @JsonKey(name: 'license_plate')
  final String licensePlate;
  final int authorized;
  @JsonKey(name: 'vehicle_type')
  final String vehicleType;
  final String image;

  Vehicle({
    required this.id,
    required this.licensePlate,
    required this.authorized,
    required this.vehicleType,
    required this.image,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) =>
      _$VehicleFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleToJson(this);
}

@JsonSerializable()
class Camera {
  final int id;
  @JsonKey(name: 'number_camera')
  final int numberCamera;
  final String location;
  final String status;
  final String department;

  Camera({
    required this.id,
    required this.numberCamera,
    required this.location,
    required this.status,
    required this.department,
  });

  factory Camera.fromJson(Map<String, dynamic> json) => _$CameraFromJson(json);

  Map<String, dynamic> toJson() => _$CameraToJson(this);
}

@JsonSerializable()
class SpeedLog {
  final int id;
  @JsonKey(name: 'license_plate')
  final String? licensePlate;
  final String? image;
  final double? speed;
  final double? limit;
  @JsonKey(name: 'created_at')
  final String createdAt;

  SpeedLog({
    required this.id,
    this.licensePlate,
    this.image,
    this.speed,
    this.limit,
    required this.createdAt,
  });

  factory SpeedLog.fromJson(Map<String, dynamic> json) => _$SpeedLogFromJson(json);
  Map<String, dynamic> toJson() => _$SpeedLogToJson(this);
}

@JsonSerializable()
class FireLog {
  final int id;
  final String type;
  final double? confidence;
  final String? image;
  @JsonKey(name: 'number_camera')
  final int? numberCamera;
  @JsonKey(name: 'created_at')
  final String createdAt;

  FireLog({
    required this.id,
    required this.type,
    this.confidence,
    this.image,
    this.numberCamera,
    required this.createdAt,
  });

  factory FireLog.fromJson(Map<String, dynamic> json) => _$FireLogFromJson(json);
  Map<String, dynamic> toJson() => _$FireLogToJson(this);
}
