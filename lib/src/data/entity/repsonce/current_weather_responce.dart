import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/src/domain/entity/current_weather_units.dart';
import 'package:weather_app/src/domain/entity/current_weather_values.dart';

part 'current_weather_responce.freezed.dart';
part 'current_weather_responce.g.dart';

@freezed
class CurrentWeatherResponce with _$CurrentWeatherResponce {
  factory CurrentWeatherResponce({
    @JsonKey(name: 'current_units')
    required CurrentWeatherUnits currentWeatherUnits,
    @JsonKey(name: 'current')
    required CurrentWeatherValues currentWeatherValues,
    String? error,
    @JsonKey(name: 'reason') String? errorReason,
  }) = _CurrentWeatherResponce;

  factory CurrentWeatherResponce.fromJson(Map<String, Object?> json) =>
      _$CurrentWeatherResponceFromJson(json);
}
