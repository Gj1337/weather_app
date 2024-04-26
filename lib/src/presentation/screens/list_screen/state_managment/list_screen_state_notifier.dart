import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/src/domain/entity/location.dart';
import 'package:weather_app/src/domain/entity/simple_weather.dart';
import 'package:weather_app/src/domain/repository/location_cache_repository.dart';
import 'package:weather_app/src/domain/repository/weather_cache_repository.dart';
import 'package:weather_app/src/domain/repository/weather_network_repository.dart';
import 'package:weather_app/src/presentation/screens/list_screen/state_managment/list_screen_state.dart';
import 'package:weather_app/src/utils/logger_mixin.dart';

final class ListScreenStateNotifier extends StateNotifier<ListScreenState>
    with LoggerMixin {
  ListScreenStateNotifier(
    this._weatherNetworkRepository,
    this._weatherCacheRepository,
    this._locationCacheRepository,
  ) : super(ListScreenState());

  final WeatherNewtorkRepository _weatherNetworkRepository;
  final WeatherCacheRepository _weatherCacheRepository;

  final LocationCacheRepository _locationCacheRepository;

  Future<void> setup() async {
    logger.i('setup');

    try {
      final cachedMainLocation =
          await _locationCacheRepository.getCachedMainLocation();

      final cityWithForecast =
          await _weatherCacheRepository.getSimpleWeatherList();

      if (cityWithForecast != null) {
        state = state.copyWith(
          mainLocation: cachedMainLocation,
          cityWithForecast: cityWithForecast,
        );

        await _refreshAllWeather(cityWithForecast.keys.toList());
      }
    } catch (exception) {
      logger.e('setup $exception');
    }
  }

  Future<void> onLocationAdded(Location location) async {
    final newCityWithForecast =
        Map<Location, SimpleWeather?>.from(state.cityWithForecast)
          ..putIfAbsent(location, () => null);

    final mainLocation = state.mainLocation ?? location;

    state = state.copyWith(
      cityWithForecast: newCityWithForecast,
      mainLocation: mainLocation,
    );

    try {
      await _locationCacheRepository.putCachedMainLocation(mainLocation);

      await _refreshAllWeather(state.cityWithForecast.keys.toList());
    } catch (exception) {
      logger.e('onLocationAdded catch $exception');
    }
  }

  Future<void> onMainLocationPicked(Location location) async {
    logger.i('onMainLocationPicked ${location.name}');

    state = state.copyWith(mainLocation: location);

    try {
      if (!state.cityWithForecast.containsKey(location)) {
        final newCityWithForecast =
            Map<Location, SimpleWeather?>.from(state.cityWithForecast)
              ..putIfAbsent(location, () => null);

        state = state.copyWith(cityWithForecast: newCityWithForecast);
      }

      await _locationCacheRepository.putCachedMainLocation(location);
    } catch (exception) {
      logger.e('onMainLocationPicked catch $exception');
    }
  }

  Future<void> onLocationDeletedClick(Location location) async {
    logger.i('onLocationDeletedClick ${location.name}');

    final newCityWithForecast =
        Map<Location, SimpleWeather?>.from(state.cityWithForecast)
          ..remove(location);

    state = state.copyWith(
      cityWithForecast: newCityWithForecast,
    );

    final newMainLocation =
        location == state.mainLocation && state.cityWithForecast.keys.isNotEmpty
            ? state.cityWithForecast.keys.first
            : null;

    state = state.copyWith(
      mainLocation: newMainLocation,
    );

    try {
      _weatherCacheRepository.removeDetailWeather(location: location);

      if (newMainLocation != null) {
        await _locationCacheRepository.putCachedMainLocation(newMainLocation);
      } else {
        await _locationCacheRepository.removeCachedMainLocation();
      }

      await _refreshAllWeather(newCityWithForecast.keys.toList());
    } catch (exception) {
      logger.e('onMainLocationPicked catch $exception');
    }
  }

  Future<void> _refreshAllWeather(List<Location> locations) async {
    final simpleWeatherList =
        await _weatherNetworkRepository.getSimpleWeathers(locations: locations);

    final Map<Location, SimpleWeather?> newCityWithForecast = {};

    for (var i = 0; i < locations.length; i++) {
      newCityWithForecast[locations[i]] = simpleWeatherList[i];
    }

    _weatherCacheRepository.putSimpleWeatherList(
        simpleWeatherRecords: newCityWithForecast);

    state = state.copyWith(cityWithForecast: newCityWithForecast);
  }
}
