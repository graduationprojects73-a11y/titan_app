import 'package:json_annotation/json_annotation.dart';

part 'ppe_log_response.g.dart';

@JsonSerializable()
class PpeLogResponse {
  final String status;
  final String message;
  final PpeLogData data;

  PpeLogResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory PpeLogResponse.fromJson(Map<String, dynamic> json) =>
      _$PpeLogResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PpeLogResponseToJson(this);
}

@JsonSerializable()
class SinglePpeLogResponse {
  final String status;
  final String message;
  final PpeLogItem data;

  SinglePpeLogResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory SinglePpeLogResponse.fromJson(Map<String, dynamic> json) =>
      _$SinglePpeLogResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SinglePpeLogResponseToJson(this);
}

@JsonSerializable()
class PpeLogData {
  final PpePaginationData helmet;
  final PpePaginationData vest;
  final PpePaginationData gloves;
  final PpePaginationData glasses;
  final PpePaginationData mask;
  final PpePaginationData boots;

  PpeLogData({
    required this.helmet,
    required this.vest,
    required this.gloves,
    required this.glasses,
    required this.mask,
    required this.boots,
  });

  factory PpeLogData.fromJson(Map<String, dynamic> json) =>
      _$PpeLogDataFromJson(json);

  Map<String, dynamic> toJson() => _$PpeLogDataToJson(this);
}

@JsonSerializable()
class PpePaginationData {
  @JsonKey(name: 'current_page')
  final int currentPage;
  final List<PpeLogItem> data;
  @JsonKey(name: 'first_page_url')
  final String? firstPageUrl;
  final int? from;
  @JsonKey(name: 'last_page')
  final int lastPage;
  @JsonKey(name: 'last_page_url')
  final String? lastPageUrl;
  @JsonKey(name: 'next_page_url')
  final String? nextPageUrl;
  final String? path;
  @JsonKey(name: 'per_page')
  final int perPage;
  @JsonKey(name: 'prev_page_url')
  final String? prevPageUrl;
  final int? to;
  final int total;

  PpePaginationData({
    required this.currentPage,
    required this.data,
    this.firstPageUrl,
    this.from,
    required this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    required this.perPage,
    this.prevPageUrl,
    this.to,
    required this.total,
  });

  factory PpePaginationData.fromJson(Map<String, dynamic> json) =>
      _$PpePaginationDataFromJson(json);

  Map<String, dynamic> toJson() => _$PpePaginationDataToJson(this);
}

@JsonSerializable()
class PpeLogItem {
  final int? id;
  final String? image;
  @JsonKey(name: 'camera_id')
  final int? cameraId;
  @JsonKey(name: 'worker_id')
  final int? workerId;
  @JsonKey(name: 'ppe_id')
  final int? ppeId;
  final String? status;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  final PpeLogCamera? camera;
  final PpeLogWorker? worker;
  final PpeLogPee? pees;

  PpeLogItem({
    this.id,
    this.image,
    this.cameraId,
    this.workerId,
    this.ppeId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.camera,
    this.worker,
    this.pees,
  });

  String? get location => camera?.location;
  String? get department => camera?.department;

  factory PpeLogItem.fromJson(Map<String, dynamic> json) =>
      _$PpeLogItemFromJson(json);

  Map<String, dynamic> toJson() => _$PpeLogItemToJson(this);
}

@JsonSerializable()
class PpeLogCamera {
  final int id;
  @JsonKey(name: 'number_camera')
  final int numberCamera;
  final String location;
  final String status;
  final String department;

  PpeLogCamera({
    required this.id,
    required this.numberCamera,
    required this.location,
    required this.status,
    required this.department,
  });

  factory PpeLogCamera.fromJson(Map<String, dynamic> json) =>
      _$PpeLogCameraFromJson(json);

  Map<String, dynamic> toJson() => _$PpeLogCameraToJson(this);
}

@JsonSerializable()
class PpeLogWorker {
  final int id;
  final String name;
  final String? phone;
  final String? position;
  final String? department;
  final String? image;

  PpeLogWorker({
    required this.id,
    required this.name,
    this.phone,
    this.position,
    this.department,
    this.image,
  });

  factory PpeLogWorker.fromJson(Map<String, dynamic> json) =>
      _$PpeLogWorkerFromJson(json);

  Map<String, dynamic> toJson() => _$PpeLogWorkerToJson(this);
}

@JsonSerializable()
class PpeLogPee {
  final int id;
  @JsonKey(name: 'ppe_type')
  final String ppeType;
  final String description;

  PpeLogPee({
    required this.id,
    required this.ppeType,
    required this.description,
  });

  factory PpeLogPee.fromJson(Map<String, dynamic> json) =>
      _$PpeLogPeeFromJson(json);

  Map<String, dynamic> toJson() => _$PpeLogPeeToJson(this);
}
