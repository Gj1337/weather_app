import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/generated/locale_keys.g.dart';
import 'package:weather_app/src/domain/repository/location_repository.dart';
import 'package:weather_app/src/presentation/screens/pick_city_screen/state_managment/pick_city_screen_state.dart';
import 'package:weather_app/src/utils/logger_mixin.dart';

final class PickCityScreenStateNotifier
    extends StateNotifier<PickCityScreenState> with LoggerMixin {
  PickCityScreenStateNotifier(
    this._locationRepository,
  ) : super(PickCityScreenState()) {
    onCreate();
  }

  final LocationRepository _locationRepository;

  Future<void> onCreate() async {
    logger.i('onCreate');
  }

  Future<void> updatePosibleCities(String cityName) async {
    logger.i('updatePosibleCities $cityName');

    if (cityName.isEmpty) return;

    try {
      state = state.copyWith(fetchError: null);

      final newCities =
          await _locationRepository.getLocationsByName(cityName.toLowerCase());

      state = state.copyWith(possibleCities: newCities);
    } catch (exception) {
      logger.e('updatePosibleCities catch $exception');

      state = state.copyWith(fetchError: LocaleKeys.errors_commonError.tr());
    }
  }
}
