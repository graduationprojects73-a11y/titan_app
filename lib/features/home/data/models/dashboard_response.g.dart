// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardResponse _$DashboardResponseFromJson(Map<String, dynamic> json) =>
    DashboardResponse(
      status: json['status'] as String,
      message: json['message'] as String,
      data: DashboardData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DashboardResponseToJson(DashboardResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

DashboardData _$DashboardDataFromJson(Map<String, dynamic> json) =>
    DashboardData(
      todayAccidentCount: (json['today_accident_count'] as num).toInt(),
      safetyCompliance: json['safety_compliance'],
      areaWithMostViolations: json['area_with_most_violations'] == null
          ? null
          : AreaWithMostViolations.fromJson(
              json['area_with_most_violations'] as Map<String, dynamic>,
            ),
      realTimeAlerts: RealTimeAlerts.fromJson(
        json['real_time_alerts'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$DashboardDataToJson(DashboardData instance) =>
    <String, dynamic>{
      'today_accident_count': instance.todayAccidentCount,
      'safety_compliance': instance.safetyCompliance,
      'area_with_most_violations': instance.areaWithMostViolations,
      'real_time_alerts': instance.realTimeAlerts,
    };

AreaWithMostViolations _$AreaWithMostViolationsFromJson(
  Map<String, dynamic> json,
) => AreaWithMostViolations(
  title: json['title'] as String,
  area: json['area'] as String?,
  total: (json['total'] as num).toInt(),
);

Map<String, dynamic> _$AreaWithMostViolationsToJson(
  AreaWithMostViolations instance,
) => <String, dynamic>{
  'title': instance.title,
  'area': instance.area,
  'total': instance.total,
};

RealTimeAlerts _$RealTimeAlertsFromJson(Map<String, dynamic> json) =>
    RealTimeAlerts(
      title: json['title'] as String,
      ppeLog: (json['ppe_log'] as List<dynamic>?)
          ?.map((e) => PpeLog.fromJson(e as Map<String, dynamic>))
          .toList(),
      vehicleLog: (json['vehicle_log'] as List<dynamic>?)
          ?.map((e) => VehicleLog.fromJson(e as Map<String, dynamic>))
          .toList(),
      speedLog: (json['speed_log'] as List<dynamic>?)
          ?.map((e) => SpeedLog.fromJson(e as Map<String, dynamic>))
          .toList(),
      fireLog: (json['fire_log'] as List<dynamic>?)
          ?.map((e) => FireLog.fromJson(e as Map<String, dynamic>))
          .toList(),
      areaLog: json['area_log'],
    );

Map<String, dynamic> _$RealTimeAlertsToJson(RealTimeAlerts instance) =>
    <String, dynamic>{
      'title': instance.title,
      'ppe_log': instance.ppeLog,
      'vehicle_log': instance.vehicleLog,
      'speed_log': instance.speedLog,
      'fire_log': instance.fireLog,
      'area_log': instance.areaLog,
    };

PpeLog _$PpeLogFromJson(Map<String, dynamic> json) => PpeLog(
  id: (json['id'] as num).toInt(),
  image: json['image'] as String,
  ppeId: (json['ppe_id'] as num).toInt(),
  cameraId: (json['camera_id'] as num).toInt(),
  workerId: (json['worker_id'] as num).toInt(),
  createdAt: json['created_at'] as String,
  worker: json['worker'] == null
      ? null
      : Worker.fromJson(json['worker'] as Map<String, dynamic>),
  pees: json['pees'] == null
      ? null
      : Ppe.fromJson(json['pees'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PpeLogToJson(PpeLog instance) => <String, dynamic>{
  'id': instance.id,
  'image': instance.image,
  'ppe_id': instance.ppeId,
  'camera_id': instance.cameraId,
  'worker_id': instance.workerId,
  'created_at': instance.createdAt,
  'worker': instance.worker,
  'pees': instance.pees,
};

Worker _$WorkerFromJson(Map<String, dynamic> json) => Worker(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  phone: json['phone'] as String?,
  position: json['position'] as String?,
  department: json['department'] as String?,
  image: json['image'] as String?,
);

Map<String, dynamic> _$WorkerToJson(Worker instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'phone': instance.phone,
  'position': instance.position,
  'department': instance.department,
  'image': instance.image,
};

Ppe _$PpeFromJson(Map<String, dynamic> json) => Ppe(
  id: (json['id'] as num).toInt(),
  ppeType: json['ppe_type'] as String,
  description: json['description'] as String,
);

Map<String, dynamic> _$PpeToJson(Ppe instance) => <String, dynamic>{
  'id': instance.id,
  'ppe_type': instance.ppeType,
  'description': instance.description,
};

VehicleLog _$VehicleLogFromJson(Map<String, dynamic> json) => VehicleLog(
  id: (json['id'] as num).toInt(),
  licensePlate: json['license_plate'] as String,
  image: json['image'] as String,
  authorized: (json['authorized'] as num).toInt(),
  vehicleId: (json['vehicle_id'] as num).toInt(),
  cameraId: (json['camera_id'] as num).toInt(),
  createdAt: json['created_at'] as String,
  vehicle: json['vehicle'] == null
      ? null
      : Vehicle.fromJson(json['vehicle'] as Map<String, dynamic>),
  camera: json['camera'] == null
      ? null
      : Camera.fromJson(json['camera'] as Map<String, dynamic>),
);

Map<String, dynamic> _$VehicleLogToJson(VehicleLog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'license_plate': instance.licensePlate,
      'image': instance.image,
      'authorized': instance.authorized,
      'vehicle_id': instance.vehicleId,
      'camera_id': instance.cameraId,
      'created_at': instance.createdAt,
      'vehicle': instance.vehicle,
      'camera': instance.camera,
    };

Vehicle _$VehicleFromJson(Map<String, dynamic> json) => Vehicle(
  id: (json['id'] as num).toInt(),
  licensePlate: json['license_plate'] as String,
  authorized: (json['authorized'] as num).toInt(),
  vehicleType: json['vehicle_type'] as String,
  image: json['image'] as String,
);

Map<String, dynamic> _$VehicleToJson(Vehicle instance) => <String, dynamic>{
  'id': instance.id,
  'license_plate': instance.licensePlate,
  'authorized': instance.authorized,
  'vehicle_type': instance.vehicleType,
  'image': instance.image,
};

Camera _$CameraFromJson(Map<String, dynamic> json) => Camera(
  id: (json['id'] as num).toInt(),
  numberCamera: (json['number_camera'] as num).toInt(),
  location: json['location'] as String,
  status: json['status'] as String,
  department: json['department'] as String,
);

Map<String, dynamic> _$CameraToJson(Camera instance) => <String, dynamic>{
  'id': instance.id,
  'number_camera': instance.numberCamera,
  'location': instance.location,
  'status': instance.status,
  'department': instance.department,
};

SpeedLog _$SpeedLogFromJson(Map<String, dynamic> json) => SpeedLog(
  id: (json['id'] as num).toInt(),
  licensePlate: json['license_plate'] as String?,
  image: json['image'] as String?,
  speed: (json['speed'] as num?)?.toDouble(),
  limit: (json['limit'] as num?)?.toDouble(),
  createdAt: json['created_at'] as String,
);

Map<String, dynamic> _$SpeedLogToJson(SpeedLog instance) => <String, dynamic>{
  'id': instance.id,
  'license_plate': instance.licensePlate,
  'image': instance.image,
  'speed': instance.speed,
  'limit': instance.limit,
  'created_at': instance.createdAt,
};

FireLog _$FireLogFromJson(Map<String, dynamic> json) => FireLog(
  id: (json['id'] as num).toInt(),
  type: json['type'] as String,
  confidence: (json['confidence'] as num?)?.toDouble(),
  image: json['image'] as String?,
  numberCamera: (json['number_camera'] as num?)?.toInt(),
  createdAt: json['created_at'] as String,
);

Map<String, dynamic> _$FireLogToJson(FireLog instance) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'confidence': instance.confidence,
  'image': instance.image,
  'number_camera': instance.numberCamera,
  'created_at': instance.createdAt,
};
