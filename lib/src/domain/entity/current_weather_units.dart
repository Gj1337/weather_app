import 'package:freezed_annotation/freezed_annotation.dart';

part 'current_weather_units.freezed.dart';
part 'current_weather_units.g.dart';

@freezed
class CurrentWeatherUnits with _$CurrentWeatherUnits {
  factory CurrentWeatherUnits({
    required String time,
    required String interval,
    @JsonKey(name: 'temperature_2m') required String temperature,
    @JsonKey(name: 'relative_humidity_2m') required String relativeHumidity,
    @JsonKey(name: 'wind_speed_10m') required String windSpeed,
    @JsonKey(name: 'wind_direction_10m') required String windDirection,
  }) = _CurrentWeatherUnits;

  factory CurrentWeatherUnits.fromJson(Map<String, Object?> json) =>
      _$CurrentWeatherUnitsFromJson(json);
}
