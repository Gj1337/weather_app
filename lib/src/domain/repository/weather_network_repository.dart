import 'package:weather_app/src/domain/entity/detail_weather.dart';
import 'package:weather_app/src/domain/entity/location.dart';
import 'package:weather_app/src/domain/entity/simple_weather.dart';

abstract interface class WeatherNewtorkRepository {
  Future<DetailWeather> getDetailWeather({required Location location});

  Future<List<SimpleWeather>> getSimpleWeathers(
      {required List<Location> locations});
}
