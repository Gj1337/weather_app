import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/generated/locale_keys.g.dart';
import 'package:weather_app/src/domain/entity/location.dart';
import 'package:weather_app/src/domain/repository/location_repository.dart';
import 'package:weather_app/src/domain/repository/weather_repository.dart';
import 'package:weather_app/src/presentation/screens/main_screen/state_managment/main_screen_state.dart';
import 'package:weather_app/src/utils/logger_mixin.dart';

final class MainScreenStateNotifier extends StateNotifier<MainScreenState>
    with LoggerMixin {
  MainScreenStateNotifier(
    this._weatherRepository,
    this._locationRepository,
  ) : super(MainScreenState()) {
    onCreate();
  }

  final WeatherRepository _weatherRepository;
  final LocationRepository _locationRepository;

  Future<void> _updateWeather(Location location) async {
    final currentWeather =
        await _weatherRepository.getCurrentWeather(location: location);

    state = state.copyWith(currentWeather: currentWeather);

    await _weatherRepository.putCachedCurrentWeather(currentWeather);
  }

  Future<void> onCreate() async {
    logger.i('onCreate');

    try {
      final cachedLocation = await _locationRepository.getCachedMainLocation();

      if (cachedLocation != null) {
        state = state.copyWith(location: cachedLocation);

        final cachedWeather =
            await _weatherRepository.getCachedCurrentWeather();

        state = state.copyWith(currentWeather: cachedWeather);

        await _updateWeather(cachedLocation);
      }
    } catch (exception) {
      logger.e('onCreate $exception');
    }
  }

  Future<void> onNewLocationChanged(Location location) async {
    logger.i('onNewLocationChanged ${location.name}');

    try {
      state = state.copyWith(
        fetchError: null,
        location: location,
      );

      await _locationRepository.putCachedMainLocation(location);

      await _updateWeather(location);
    } catch (exception) {
      logger.e('onNewLocationChanged catch $exception');

      state = state.copyWith(fetchError: LocaleKeys.errors_commonError.tr());
    }
  }

  Future<void> onRefreshWeathreClick() async {
    logger.e('onRefreshWeathreClick');

    final location = state.location;

    try {
      if (location != null) {
        await _updateWeather(location);
      }
    } catch (exception) {
      logger.e('onNewLocationChanged catch $exception');
    }
  }
}
