import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/generated/locale_keys.g.dart';
import 'package:weather_app/src/domain/entity/location.dart';
import 'package:weather_app/src/domain/repository/location_cache_repository.dart';
import 'package:weather_app/src/domain/repository/weather_cache_repository.dart';
import 'package:weather_app/src/domain/repository/weather_network_repository.dart';
import 'package:weather_app/src/presentation/screens/main_screen/state_managment/main_screen_state.dart';
import 'package:weather_app/src/utils/logger_mixin.dart';

final class MainScreenStateNotifier extends StateNotifier<MainScreenState>
    with LoggerMixin {
  MainScreenStateNotifier(
    this._weatherNetworkRepository,
    this._weatherCacheRepository,
    this._locationCacheRepository,
  ) : super(MainScreenState());

  final WeatherNewtorkRepository _weatherNetworkRepository;
  final WeatherCacheRepository _weatherCacheRepository;

  final LocationCacheRepository _locationCacheRepository;

  Future<void> _updateWeather(Location location) async {
    final detailWeather =
        await _weatherNetworkRepository.getDetailWeather(location: location);

    state = state.copyWith(detailWeather: detailWeather);

    await _weatherCacheRepository.putDetailWeather(
      location: location,
      detailWeather: detailWeather,
    );
  }

  Future<void> setup() async {
    logger.i('setup');

    try {
      final cachedLocation =
          await _locationCacheRepository.getCachedMainLocation();

      if (cachedLocation != null) {
        state = state.copyWith(location: cachedLocation);

        final cachedWeather = await _weatherCacheRepository.getDetailWeather(
          location: cachedLocation,
        );

        state = state.copyWith(detailWeather: cachedWeather);

        await _updateWeather(cachedLocation);
      }
    } catch (exception) {
      logger.e('setup $exception');
    }
  }

  Future<void> onMainLocationChanged(Location? location) async {
    logger.i('onMainLocationChanged ${location?.name}');

    try {
      state = state.copyWith(
        fetchError: null,
        location: location,
      );

      if (location != null) {
        await _updateWeather(location);
      }
    } catch (exception) {
      logger.e('onNewLocationChanged catch $exception');

      state = state.copyWith(fetchError: LocaleKeys.errors_commonError.tr());
    }
  }

  Future<void> onRefreshWeathreClick() async {
    logger.i('onRefreshWeathreClick');

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
