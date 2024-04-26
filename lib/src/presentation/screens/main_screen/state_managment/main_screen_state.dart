import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/src/domain/entity/detail_weather.dart';
import 'package:weather_app/src/domain/entity/location.dart';

part 'main_screen_state.freezed.dart';

@freezed
class MainScreenState with _$MainScreenState {
  factory MainScreenState({
    Location? location,
    DetailWeather? detailWeather,
    String? fetchError,
  }) = _MainScreenState;
}
