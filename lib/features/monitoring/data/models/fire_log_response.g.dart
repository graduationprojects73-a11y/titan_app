// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fire_log_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FireLogDetail _$FireLogDetailFromJson(Map<String, dynamic> json) =>
    FireLogDetail(
      id: (json['id'] as num).toInt(),
      type: json['type'] as String,
      confidence: _parseConfidence(json['confidence']),
      image: json['image'] as String?,
      numberCamera: (json['number_camera'] as num?)?.toInt(),
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$FireLogDetailToJson(FireLogDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'confidence': instance.confidence,
      'image': instance.image,
      'number_camera': instance.numberCamera,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

FireLogsResponse _$FireLogsResponseFromJson(Map<String, dynamic> json) =>
    FireLogsResponse(
      status: json['status'] as String,
      message: json['message'] as String,
      data: FireLogsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FireLogsResponseToJson(FireLogsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

FireLogsData _$FireLogsDataFromJson(Map<String, dynamic> json) => FireLogsData(
  currentPage: (json['current_page'] as num).toInt(),
  data: (json['data'] as List<dynamic>)
      .map((e) => FireLogDetail.fromJson(e as Map<String, dynamic>))
      .toList(),
  lastPage: (json['last_page'] as num).toInt(),
  total: (json['total'] as num).toInt(),
);

Map<String, dynamic> _$FireLogsDataToJson(FireLogsData instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'data': instance.data,
      'last_page': instance.lastPage,
      'total': instance.total,
    };

SingleFireLogResponse _$SingleFireLogResponseFromJson(
  Map<String, dynamic> json,
) => SingleFireLogResponse(
  status: json['status'] as String,
  message: json['message'] as String,
  data: FireLogDetail.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SingleFireLogResponseToJson(
  SingleFireLogResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};
