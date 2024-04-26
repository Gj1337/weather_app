import 'package:weather_app/src/domain/entity/detail_weather.dart';
import 'package:weather_app/src/domain/entity/location.dart';
import 'package:weather_app/src/domain/entity/simple_weather.dart';

abstract interface class WeatherCacheRepository {
  Future<void> putDetailWeather({
    required Location location,
    required DetailWeather detailWeather,
  });

  Future<DetailWeather?> getDetailWeather({
    required Location location,
  });

  Future<bool> removeDetailWeather({
    required Location location,
  });

  Future<Map<Location, SimpleWeather>?> getSimpleWeatherList();

  Future<void> putSimpleWeatherList({
    required Map<Location, SimpleWeather?> simpleWeatherRecords,
  });
}
