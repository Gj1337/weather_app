import 'package:weather_app/src/data/data_source/weather_cache_client.dart';
import 'package:weather_app/src/domain/entity/detail_weather.dart';
import 'package:weather_app/src/domain/entity/location.dart';
import 'package:weather_app/src/domain/entity/simple_weather.dart';
import 'package:weather_app/src/domain/repository/weather_cache_repository.dart';

final class WeatherCacheRepositoryImpl implements WeatherCacheRepository {
  WeatherCacheRepositoryImpl(
    this._weatherCacheClient,
  );

  final WeatherCacheClient _weatherCacheClient;

  @override
  Future<Map<Location, SimpleWeather>?> getSimpleWeatherList() async {
    return _weatherCacheClient.getSimpleWeatherList();
  }

  @override
  Future<void> putSimpleWeatherList(
      {required Map<Location, SimpleWeather?> simpleWeatherRecords}) async {
    _weatherCacheClient.putSimpleWeatherList(
        simpleWeatherRecords: simpleWeatherRecords);
  }

  @override
  Future<DetailWeather?> getDetailWeather({required Location location}) async {
    return _weatherCacheClient.getDetailWeather(location: location);
  }

  @override
  Future<void> putDetailWeather(
      {required Location location,
      required DetailWeather detailWeather}) async {
    _weatherCacheClient.putDetailWeather(
      location: location,
      detailWeather: detailWeather,
    );
  }

  @override
  Future<bool> removeDetailWeather({required Location location}) =>
      _weatherCacheClient.removeDetailWeather(location: location);
}
