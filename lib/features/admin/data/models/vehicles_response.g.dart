// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicles_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VehiclesResponse _$VehiclesResponseFromJson(Map<String, dynamic> json) =>
    _VehiclesResponse(
      status: json['status'] as String,
      message: json['message'] as String,
      data: VehiclesData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VehiclesResponseToJson(_VehiclesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_VehiclesData _$VehiclesDataFromJson(Map<String, dynamic> json) =>
    _VehiclesData(
      currentPage: (json['current_page'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => Vehicle.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstPageUrl: json['first_page_url'] as String,
      from: (json['from'] as num?)?.toInt(),
      lastPage: (json['last_page'] as num).toInt(),
      lastPageUrl: json['last_page_url'] as String,
      nextPageUrl: json['next_page_url'] as String?,
      path: json['path'] as String,
      perPage: (json['per_page'] as num).toInt(),
      prevPageUrl: json['prev_page_url'] as String?,
      to: (json['to'] as num?)?.toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$VehiclesDataToJson(_VehiclesData instance) =>
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
