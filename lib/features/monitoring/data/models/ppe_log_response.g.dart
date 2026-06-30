// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ppe_log_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PpeLogResponse _$PpeLogResponseFromJson(Map<String, dynamic> json) =>
    PpeLogResponse(
      status: json['status'] as String,
      message: json['message'] as String,
      data: PpeLogData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PpeLogResponseToJson(PpeLogResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

SinglePpeLogResponse _$SinglePpeLogResponseFromJson(
  Map<String, dynamic> json,
) => SinglePpeLogResponse(
  status: json['status'] as String,
  message: json['message'] as String,
  data: PpeLogItem.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SinglePpeLogResponseToJson(
  SinglePpeLogResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

PpeLogData _$PpeLogDataFromJson(Map<String, dynamic> json) => PpeLogData(
  helmet: PpePaginationData.fromJson(json['helmet'] as Map<String, dynamic>),
  vest: PpePaginationData.fromJson(json['vest'] as Map<String, dynamic>),
  gloves: PpePaginationData.fromJson(json['gloves'] as Map<String, dynamic>),
  glasses: PpePaginationData.fromJson(json['glasses'] as Map<String, dynamic>),
  mask: PpePaginationData.fromJson(json['mask'] as Map<String, dynamic>),
  boots: PpePaginationData.fromJson(json['boots'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PpeLogDataToJson(PpeLogData instance) =>
    <String, dynamic>{
      'helmet': instance.helmet,
      'vest': instance.vest,
      'gloves': instance.gloves,
      'glasses': instance.glasses,
      'mask': instance.mask,
      'boots': instance.boots,
    };

PpePaginationData _$PpePaginationDataFromJson(Map<String, dynamic> json) =>
    PpePaginationData(
      currentPage: (json['current_page'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => PpeLogItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstPageUrl: json['first_page_url'] as String?,
      from: (json['from'] as num?)?.toInt(),
      lastPage: (json['last_page'] as num).toInt(),
      lastPageUrl: json['last_page_url'] as String?,
      nextPageUrl: json['next_page_url'] as String?,
      path: json['path'] as String?,
      perPage: (json['per_page'] as num).toInt(),
      prevPageUrl: json['prev_page_url'] as String?,
      to: (json['to'] as num?)?.toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$PpePaginationDataToJson(PpePaginationData instance) =>
    <String, dynamic>{
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

PpeLogItem _$PpeLogItemFromJson(Map<String, dynamic> json) => PpeLogItem(
  id: (json['id'] as num?)?.toInt(),
  image: json['image'] as String?,
  cameraId: (json['camera_id'] as num?)?.toInt(),
  workerId: (json['worker_id'] as num?)?.toInt(),
  ppeId: (json['ppe_id'] as num?)?.toInt(),
  status: json['status'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  camera: json['camera'] == null
      ? null
      : PpeLogCamera.fromJson(json['camera'] as Map<String, dynamic>),
  worker: json['worker'] == null
      ? null
      : PpeLogWorker.fromJson(json['worker'] as Map<String, dynamic>),
  pees: json['pees'] == null
      ? null
      : PpeLogPee.fromJson(json['pees'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PpeLogItemToJson(PpeLogItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'camera_id': instance.cameraId,
      'worker_id': instance.workerId,
      'ppe_id': instance.ppeId,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'camera': instance.camera,
      'worker': instance.worker,
      'pees': instance.pees,
    };

PpeLogCamera _$PpeLogCameraFromJson(Map<String, dynamic> json) => PpeLogCamera(
  id: (json['id'] as num).toInt(),
  numberCamera: (json['number_camera'] as num).toInt(),
  location: json['location'] as String,
  status: json['status'] as String,
  department: json['department'] as String,
);

Map<String, dynamic> _$PpeLogCameraToJson(PpeLogCamera instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number_camera': instance.numberCamera,
      'location': instance.location,
      'status': instance.status,
      'department': instance.department,
    };

PpeLogWorker _$PpeLogWorkerFromJson(Map<String, dynamic> json) => PpeLogWorker(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  phone: json['phone'] as String?,
  position: json['position'] as String?,
  department: json['department'] as String?,
  image: json['image'] as String?,
);

Map<String, dynamic> _$PpeLogWorkerToJson(PpeLogWorker instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'position': instance.position,
      'department': instance.department,
      'image': instance.image,
    };

PpeLogPee _$PpeLogPeeFromJson(Map<String, dynamic> json) => PpeLogPee(
  id: (json['id'] as num).toInt(),
  ppeType: json['ppe_type'] as String,
  description: json['description'] as String,
);

Map<String, dynamic> _$PpeLogPeeToJson(PpeLogPee instance) => <String, dynamic>{
  'id': instance.id,
  'ppe_type': instance.ppeType,
  'description': instance.description,
};
