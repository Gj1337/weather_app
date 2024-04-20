import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/src/domain/entity/current_weather_units.dart';
import 'package:weather_app/src/domain/entity/current_weather_values.dart';

part 'current_weather.freezed.dart';
part 'current_weather.g.dart';

@freezed
class CurrentWeather with _$CurrentWeather {
  CurrentWeather._();

  factory CurrentWeather({
    @JsonKey(name: 'current_units') required CurrentWeatherUnits currentUnits,
    @JsonKey(name: 'current')
    required CurrentWeatherValues currentWeatherValues,
  }) = _CurrentWeather;

  factory CurrentWeather.fromJson(Map<String, Object?> json) =>
      _$CurrentWeatherFromJson(json);

  String get temperatureText => '${currentWeatherValues.temperature} '
      '${currentUnits.temperature}';

  String get humidityText => '${currentWeatherValues.relativeHumidity} '
      '${currentUnits.relativeHumidity}';

  String get windSpeedText => '${currentWeatherValues.windSpeed} '
      '${currentUnits.windSpeed}';
}
