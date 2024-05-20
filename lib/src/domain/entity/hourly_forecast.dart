import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/src/domain/entity/json_converter/date_time_converter.dart';
import 'package:weather_app/src/domain/entity/weather_state.dart';

part 'hourly_forecast.freezed.dart';
part 'hourly_forecast.g.dart';

@freezed
class HourlyForecast with _$HourlyForecast {
  factory HourlyForecast({
    @DateTimeConverter() @JsonKey(name: 'time') required List<DateTime> times,
    @WeatherStateConverter()
    @JsonKey(name: 'weather_code')
    required List<WeatherState> weatherState,
    @JsonKey(name: 'temperature_2m') required List<double> temperature,
    @JsonKey(name: 'wind_speed_10m') required List<double> windSpeed,
    @JsonKey(name: 'wind_direction_10m') required List<int> windDirection,
  }) = _HourlyForecast;

  factory HourlyForecast.fromJson(Map<String, Object?> json) =>
      _$HourlyForecastFromJson(json);
}
