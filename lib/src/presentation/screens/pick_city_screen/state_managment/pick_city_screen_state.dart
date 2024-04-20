import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/src/domain/entity/location.dart';

part 'pick_city_screen_state.freezed.dart';

@freezed
class PickCityScreenState with _$PickCityScreenState {
  factory PickCityScreenState({
    @Default([]) List<Location> possibleCities,
    String? fetchError,
  }) = _PickCityScreenState;
}
