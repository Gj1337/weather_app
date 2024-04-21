import 'package:weather_app/src/domain/entity/current_weather.dart';
import 'package:weather_app/src/domain/entity/location.dart';

abstract interface class WeatherRepository {
  Future<CurrentWeather> getCurrentWeather({required Location location});

  Future<void> putCachedCurrentWeather(CurrentWeather currentWeather);

  Future<CurrentWeather?> getCachedCurrentWeather();
}
