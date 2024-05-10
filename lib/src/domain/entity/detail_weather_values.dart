import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/src/domain/entity/is_day_converter.dart';
import 'package:weather_app/src/domain/entity/weather_state.dart';

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
    @WeatherStateConverter()
    @JsonKey(name: 'weather_code')
    required WeatherState currentWeatherState,
    @IsDayConverter()
    @JsonKey(
      name: "is_day",
    )
    required bool isDay,
  }) = _DetailWeatherValues;

  factory DetailWeatherValues.fromJson(Map<String, Object?> json) =>
      _$DetailWeatherValuesFromJson(json);
}
