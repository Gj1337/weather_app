import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/src/domain/entity/simple_weather_units.dart';
import 'package:weather_app/src/domain/entity/simple_weather_values.dart';

part 'simple_weather_responce.freezed.dart';
part 'simple_weather_responce.g.dart';

@freezed
class SimpleWeatherResponce with _$SimpleWeatherResponce {
  factory SimpleWeatherResponce({
    @JsonKey(name: 'current_units')
    required SimpleWeatherUnits simpleWeatherUnits,
    @JsonKey(name: 'current') required SimpleWeatherValues simpleWeatherValues,
    String? error,
    @JsonKey(name: 'reason') String? errorReason,
  }) = _SimpleWeatherResponce;

  factory SimpleWeatherResponce.fromJson(Map<String, Object?> json) =>
      _$SimpleWeatherResponceFromJson(json);
}
