import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/src/domain/entity/location.dart';

part 'posible_locations_responce.freezed.dart';
part 'posible_locations_responce.g.dart';

@freezed
class PosibleLocationsResponce with _$PosibleLocationsResponce {
  factory PosibleLocationsResponce({
    required List<Location>? results,
    String? error,
    @JsonKey(name: 'reason') String? errorReason,
  }) = _PosibleLocationsResponce;

  factory PosibleLocationsResponce.fromJson(Map<String, Object?> json) =>
      _$PosibleLocationsResponceFromJson(json);
}
