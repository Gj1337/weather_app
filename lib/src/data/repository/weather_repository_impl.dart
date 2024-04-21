import 'package:weather_app/src/data/data_source/weather_cache_client.dart';
import 'package:weather_app/src/data/data_source/weather_rest_client.dart';
import 'package:weather_app/src/domain/entity/current_weather.dart';
import 'package:weather_app/src/domain/entity/location.dart';
import 'package:weather_app/src/domain/repository/weather_repository.dart';

final class WeatherRepositoryImpl implements WeatherRepository {
  WeatherRepositoryImpl(
    this._weatherRestClient,
    this._weatherCacheClient,
  );

  final WeatherRestClient _weatherRestClient;
  final WeatherCacheClient _weatherCacheClient;

  @override
  Future<CurrentWeather> getCurrentWeather({required Location location}) async {
    final currentWeatherResponce = await _weatherRestClient.getCurrentWeather(
      location.latitude,
      location.longitude,
    );

    return CurrentWeather(
      currentWeatherValues: currentWeatherResponce.currentWeatherValues,
      currentUnits: currentWeatherResponce.currentWeatherUnits,
    );
  }

  @override
  Future<CurrentWeather?> getCachedCurrentWeather() async =>
      _weatherCacheClient.getCurrentWeather();

  @override
  Future<void> putCachedCurrentWeather(CurrentWeather currentWeather) async =>
      _weatherCacheClient.putCurrentWeather(currentWeather);
}
