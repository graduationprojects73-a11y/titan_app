// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportResponse _$ReportResponseFromJson(Map<String, dynamic> json) =>
    ReportResponse(
      status: json['status'] as String,
      message: json['message'] as String,
      data: ReportData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReportResponseToJson(ReportResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

ReportData _$ReportDataFromJson(Map<String, dynamic> json) => ReportData(
  daily: ReportPeriod.fromJson(json['daily'] as Map<String, dynamic>),
  weekly: ReportPeriod.fromJson(json['weekly'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ReportDataToJson(ReportData instance) =>
    <String, dynamic>{'daily': instance.daily, 'weekly': instance.weekly};

ReportPeriod _$ReportPeriodFromJson(Map<String, dynamic> json) => ReportPeriod(
  report: Report.fromJson(json['report'] as Map<String, dynamic>),
  safetyCompliance: json['safety_compliance'] as num,
);

Map<String, dynamic> _$ReportPeriodToJson(ReportPeriod instance) =>
    <String, dynamic>{
      'report': instance.report,
      'safety_compliance': instance.safetyCompliance,
    };

Report _$ReportFromJson(Map<String, dynamic> json) => Report(
  ppeLogs: (json['ppe_logs'] as num).toInt(),
  vehicleLogs: (json['vehicle_logs'] as num).toInt(),
  speedViolations: (json['speed_violations'] as num).toInt(),
  fireLogs: (json['fire_logs'] as num).toInt(),
  areaLogs: (json['area_logs'] as num?)?.toInt(),
  mostDangerousAreas: (json['most_dangerous_areas'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$ReportToJson(Report instance) => <String, dynamic>{
  'ppe_logs': instance.ppeLogs,
  'vehicle_logs': instance.vehicleLogs,
  'speed_violations': instance.speedViolations,
  'fire_logs': instance.fireLogs,
  'area_logs': instance.areaLogs,
  'most_dangerous_areas': instance.mostDangerousAreas,
};
