import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_weather_values.freezed.dart';
part 'detail_weather_values.g.dart';

@freezed
class DetailWeatherValues with _$DetailWeatherValues {
  factory DetailWeatherValues({
    required String time,
    required int interval,
    @JsonKey(name: 'temperature_2m') required double temperature,
    @JsonKey(name: 'relative_humidity_2m') required int relativeHumidity,
    @JsonKey(name: 'wind_speed_10m') required double windSpeed,
    @JsonKey(name: 'wind_direction_10m') required int windDirection,
  }) = _DetailWeatherValues;

  factory DetailWeatherValues.fromJson(Map<String, Object?> json) =>
      _$DetailWeatherValuesFromJson(json);
}
