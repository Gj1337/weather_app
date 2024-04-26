import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/src/domain/entity/location.dart';
import 'package:weather_app/src/domain/entity/simple_weather.dart';

part 'list_screen_state.freezed.dart';

@freezed
class ListScreenState with _$ListScreenState {
  factory ListScreenState({
    Location? mainLocation,
    @Default({}) Map<Location, SimpleWeather?> cityWithForecast,
  }) = _ListScreenState;
}
