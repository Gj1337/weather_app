import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/src/domain/entity/detail_weather_units.dart';
import 'package:weather_app/src/domain/entity/detail_weather_values.dart';
import 'package:weather_app/src/domain/entity/hourly_forecast.dart';

part 'detail_weather.freezed.dart';
part 'detail_weather.g.dart';

@freezed
class DetailWeather with _$DetailWeather {
  DetailWeather._();

  factory DetailWeather({
    @JsonKey(name: 'current_units')
    required DetailWeatherUnits detailWeatherUnits,
    @JsonKey(name: 'current') required DetailWeatherValues detailWeatherValues,
    required HourlyForecast hourlyForecast,
  }) = _DetailWeather;

  factory DetailWeather.fromJson(Map<String, Object?> json) =>
      _$DetailWeatherFromJson(json);

  String get temperatureText =>
      '${detailWeatherValues.temperature.toStringAsFixed(0)} '
      '${detailWeatherUnits.temperature}';

  String get humidityText => '${detailWeatherValues.relativeHumidity} '
      '${detailWeatherUnits.relativeHumidity}';

  String get windSpeedText => '${detailWeatherValues.windSpeed} '
      '${detailWeatherUnits.windSpeed}';
}
