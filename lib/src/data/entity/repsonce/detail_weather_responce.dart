import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/src/domain/entity/detail_weather_units.dart';
import 'package:weather_app/src/domain/entity/detail_weather_values.dart';

part 'detail_weather_responce.freezed.dart';
part 'detail_weather_responce.g.dart';

@freezed
class DetailWeatherResponce with _$DetailWeatherResponce {
  factory DetailWeatherResponce({
    @JsonKey(name: 'current_units')
    required DetailWeatherUnits detailWeatherUnits,
    @JsonKey(name: 'current') required DetailWeatherValues detailWeatherValues,
    String? error,
    @JsonKey(name: 'reason') String? errorReason,
  }) = _DetailWeatherResponce;

  factory DetailWeatherResponce.fromJson(Map<String, Object?> json) =>
      _$DetailWeatherResponceFromJson(json);
}
