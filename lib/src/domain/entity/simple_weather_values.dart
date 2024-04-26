import 'package:freezed_annotation/freezed_annotation.dart';

part 'simple_weather_values.freezed.dart';
part 'simple_weather_values.g.dart';

@freezed
class SimpleWeatherValues with _$SimpleWeatherValues {
  factory SimpleWeatherValues({
    required String time,
    required int interval,
    @JsonKey(name: 'temperature_2m') required double temperature,
    @JsonKey(name: 'relative_humidity_2m') required int relativeHumidity,
    @JsonKey(name: 'wind_speed_10m') required double windSpeed,
    @JsonKey(name: 'wind_direction_10m') required int windDirection,
  }) = _SimpleWeatherValues;

  factory SimpleWeatherValues.fromJson(Map<String, Object?> json) =>
      _$SimpleWeatherValuesFromJson(json);
}
