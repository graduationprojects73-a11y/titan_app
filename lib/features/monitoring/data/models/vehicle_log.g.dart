// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VehicleLogResponse _$VehicleLogResponseFromJson(Map<String, dynamic> json) =>
    _VehicleLogResponse(
      status: json['status'] as String,
      message: json['message'] as String,
      data: VehicleLogPaginationData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$VehicleLogResponseToJson(_VehicleLogResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_SingleVehicleLogResponse _$SingleVehicleLogResponseFromJson(
  Map<String, dynamic> json,
) => _SingleVehicleLogResponse(
  status: json['status'] as String,
  message: json['message'] as String,
  data: VehicleLog.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SingleVehicleLogResponseToJson(
  _SingleVehicleLogResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

_VehicleLogPaginationData _$VehicleLogPaginationDataFromJson(
  Map<String, dynamic> json,
) => _VehicleLogPaginationData(
  currentPage: (json['current_page'] as num).toInt(),
  data: (json['data'] as List<dynamic>)
      .map((e) => VehicleLog.fromJson(e as Map<String, dynamic>))
      .toList(),
  firstPageUrl: json['first_page_url'] as String,
  from: (json['from'] as num).toInt(),
  lastPage: (json['last_page'] as num).toInt(),
  lastPageUrl: json['last_page_url'] as String,
  nextPageUrl: json['next_page_url'] as String?,
  path: json['path'] as String,
  perPage: (json['per_page'] as num).toInt(),
  prevPageUrl: json['prev_page_url'] as String?,
  to: (json['to'] as num).toInt(),
  total: (json['total'] as num).toInt(),
);

Map<String, dynamic> _$VehicleLogPaginationDataToJson(
  _VehicleLogPaginationData instance,
) => <String, dynamic>{
  'current_page': instance.currentPage,
  'data': instance.data,
  'first_page_url': instance.firstPageUrl,
  'from': instance.from,
  'last_page': instance.lastPage,
  'last_page_url': instance.lastPageUrl,
  'next_page_url': instance.nextPageUrl,
  'path': instance.path,
  'per_page': instance.perPage,
  'prev_page_url': instance.prevPageUrl,
  'to': instance.to,
  'total': instance.total,
};

_VehicleLog _$VehicleLogFromJson(Map<String, dynamic> json) => _VehicleLog(
  id: (json['id'] as num).toInt(),
  licensePlate: json['license_plate'] as String,
  image: json['image'] as String,
  authorized: (json['authorized'] as num).toInt(),
  vehicleId: (json['vehicle_id'] as num).toInt(),
  cameraId: (json['camera_id'] as num).toInt(),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  camera: json['camera'] == null
      ? null
      : Camera.fromJson(json['camera'] as Map<String, dynamic>),
  vehicle: json['vehicle'] == null
      ? null
      : Vehicle.fromJson(json['vehicle'] as Map<String, dynamic>),
);

Map<String, dynamic> _$VehicleLogToJson(_VehicleLog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'license_plate': instance.licensePlate,
      'image': instance.image,
      'authorized': instance.authorized,
      'vehicle_id': instance.vehicleId,
      'camera_id': instance.cameraId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'camera': instance.camera,
      'vehicle': instance.vehicle,
    };

_Camera _$CameraFromJson(Map<String, dynamic> json) => _Camera(
  id: (json['id'] as num).toInt(),
  numberCamera: (json['number_camera'] as num).toInt(),
  userId: (json['user_id'] as num).toInt(),
  location: json['location'] as String,
  status: json['status'] as String,
  installationDate: json['installation_date'] as String,
  department: json['department'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$CameraToJson(_Camera instance) => <String, dynamic>{
  'id': instance.id,
  'number_camera': instance.numberCamera,
  'user_id': instance.userId,
  'location': instance.location,
  'status': instance.status,
  'installation_date': instance.installationDate,
  'department': instance.department,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};

_Vehicle _$VehicleFromJson(Map<String, dynamic> json) => _Vehicle(
  id: (json['id'] as num).toInt(),
  licensePlate: json['license_plate'] as String,
  authorized: (json['authorized'] as num).toInt(),
  vehicleType: json['vehicle_type'] as String,
  image: json['image'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$VehicleToJson(_Vehicle instance) => <String, dynamic>{
  'id': instance.id,
  'license_plate': instance.licensePlate,
  'authorized': instance.authorized,
  'vehicle_type': instance.vehicleType,
  'image': instance.image,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};
