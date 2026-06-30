import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:titan/features/monitoring/data/models/vehicle_log.dart';

part 'vehicles_response.freezed.dart';
part 'vehicles_response.g.dart';

@freezed
abstract class VehiclesResponse with _$VehiclesResponse {
  const factory VehiclesResponse({
    required String status,
    required String message,
    required VehiclesData data,
  }) = _VehiclesResponse;

  factory VehiclesResponse.fromJson(Map<String, dynamic> json) =>
      _$VehiclesResponseFromJson(json);
}

@freezed
abstract class VehiclesData with _$VehiclesData {
  const factory VehiclesData({
    @JsonKey(name: 'current_page') required int currentPage,
    required List<Vehicle> data,
    @JsonKey(name: 'first_page_url') required String firstPageUrl,
    int? from,
    @JsonKey(name: 'last_page') required int lastPage,
    @JsonKey(name: 'last_page_url') required String lastPageUrl,
    @JsonKey(name: 'next_page_url') String? nextPageUrl,
    required String path,
    @JsonKey(name: 'per_page') required int perPage,
    @JsonKey(name: 'prev_page_url') String? prevPageUrl,
    int? to,
    required int total,
  }) = _VehiclesData;

  factory VehiclesData.fromJson(Map<String, dynamic> json) =>
      _$VehiclesDataFromJson(json);
}
