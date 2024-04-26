import 'package:freezed_annotation/freezed_annotation.dart';

part 'simple_weather_units.freezed.dart';
part 'simple_weather_units.g.dart';

@freezed
class SimpleWeatherUnits with _$SimpleWeatherUnits {
  factory SimpleWeatherUnits({
    required String time,
    required String interval,
    @JsonKey(name: 'temperature_2m') required String temperature,
    @JsonKey(name: 'relative_humidity_2m') required String relativeHumidity,
    @JsonKey(name: 'wind_speed_10m') required String windSpeed,
    @JsonKey(name: 'wind_direction_10m') required String windDirection,
  }) = _SimpleWeatherUnits;

  factory SimpleWeatherUnits.fromJson(Map<String, Object?> json) =>
      _$SimpleWeatherUnitsFromJson(json);
}
