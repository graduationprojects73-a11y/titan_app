import 'package:json_annotation/json_annotation.dart';

part 'report_response.g.dart';

@JsonSerializable()
class ReportResponse {
  final String status;
  final String message;
  final ReportData data;

  ReportResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ReportResponse.fromJson(Map<String, dynamic> json) =>
      _$ReportResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReportResponseToJson(this);
}

@JsonSerializable()
class ReportData {
  final ReportPeriod daily;
  final ReportPeriod weekly;

  ReportData({required this.daily, required this.weekly});

  factory ReportData.fromJson(Map<String, dynamic> json) =>
      _$ReportDataFromJson(json);

  Map<String, dynamic> toJson() => _$ReportDataToJson(this);
}

@JsonSerializable()
class ReportPeriod {
  final Report report;
  @JsonKey(name: 'safety_compliance')
  final num safetyCompliance;

  ReportPeriod({required this.report, required this.safetyCompliance});

  factory ReportPeriod.fromJson(Map<String, dynamic> json) =>
      _$ReportPeriodFromJson(json);

  Map<String, dynamic> toJson() => _$ReportPeriodToJson(this);
}

@JsonSerializable()
class Report {
  @JsonKey(name: 'ppe_logs')
  final int ppeLogs;
  @JsonKey(name: 'vehicle_logs')
  final int vehicleLogs;
  @JsonKey(name: 'speed_violations')
  final int speedViolations;
  @JsonKey(name: 'fire_logs')
  final int fireLogs;
  @JsonKey(name: 'area_logs')
  final int? areaLogs;
  @JsonKey(name: 'most_dangerous_areas')
  final List<String>? mostDangerousAreas;

  Report({
    required this.ppeLogs,
    required this.vehicleLogs,
    required this.speedViolations,
    required this.fireLogs,
    this.areaLogs,
    this.mostDangerousAreas,
  });

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);

  Map<String, dynamic> toJson() => _$ReportToJson(this);

  int get totalLogs => ppeLogs + vehicleLogs + (areaLogs ?? 0) + speedViolations + fireLogs;
}
