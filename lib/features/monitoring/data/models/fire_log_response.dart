import 'package:json_annotation/json_annotation.dart';

part 'fire_log_response.g.dart';

double? _parseConfidence(dynamic val) {
  if (val == null) return null;
  if (val is num) return val.toDouble();
  if (val is String) return double.tryParse(val);
  return null;
}

@JsonSerializable()
class FireLogDetail {
  final int id;
  final String type;
  @JsonKey(name: 'confidence', fromJson: _parseConfidence)
  final double? confidence;
  final String? image;
  @JsonKey(name: 'number_camera')
  final int? numberCamera;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  FireLogDetail({
    required this.id,
    required this.type,
    this.confidence,
    this.image,
    this.numberCamera,
    required this.createdAt,
    required this.updatedAt,
  });

  factory FireLogDetail.fromJson(Map<String, dynamic> json) =>
      _$FireLogDetailFromJson(json);

  Map<String, dynamic> toJson() => _$FireLogDetailToJson(this);
}

@JsonSerializable()
class FireLogsResponse {
  final String status;
  final String message;
  final FireLogsData data;

  FireLogsResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory FireLogsResponse.fromJson(Map<String, dynamic> json) =>
      _$FireLogsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FireLogsResponseToJson(this);
}

@JsonSerializable()
class FireLogsData {
  @JsonKey(name: 'current_page')
  final int currentPage;
  final List<FireLogDetail> data;
  @JsonKey(name: 'last_page')
  final int lastPage;
  final int total;

  FireLogsData({
    required this.currentPage,
    required this.data,
    required this.lastPage,
    required this.total,
  });

  factory FireLogsData.fromJson(Map<String, dynamic> json) =>
      _$FireLogsDataFromJson(json);

  Map<String, dynamic> toJson() => _$FireLogsDataToJson(this);
}

@JsonSerializable()
class SingleFireLogResponse {
  final String status;
  final String message;
  final FireLogDetail data;

  SingleFireLogResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory SingleFireLogResponse.fromJson(Map<String, dynamic> json) =>
      _$SingleFireLogResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SingleFireLogResponseToJson(this);
}
