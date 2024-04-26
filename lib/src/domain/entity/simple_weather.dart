import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/src/domain/entity/simple_weather_units.dart';
import 'package:weather_app/src/domain/entity/simple_weather_values.dart';

part 'simple_weather.freezed.dart';
part 'simple_weather.g.dart';

@freezed
class SimpleWeather with _$SimpleWeather {
  SimpleWeather._();

  factory SimpleWeather({
    @JsonKey(name: 'current_units')
    required SimpleWeatherUnits simpleWeatherUnits,
    @JsonKey(name: 'current') required SimpleWeatherValues simpleWeatherValues,
  }) = _SimpleWeather;

  factory SimpleWeather.fromJson(Map<String, Object?> json) =>
      _$SimpleWeatherFromJson(json);

  String get temperatureText =>
      '${simpleWeatherValues.temperature.toStringAsFixed(0)} '
      '${simpleWeatherUnits.temperature}';

  String get humidityText => '${simpleWeatherValues.relativeHumidity} '
      '${simpleWeatherUnits.relativeHumidity}';

  String get windSpeedText => '${simpleWeatherValues.windSpeed} '
      '${simpleWeatherUnits.windSpeed}';
}
